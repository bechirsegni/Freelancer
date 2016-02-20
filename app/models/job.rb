class Job < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks


  has_attached_file :document
  validates_attachment :document, content_type: { content_type: "application/pdf" }


  belongs_to :category
  belongs_to :user
  has_many   :bids ,   :dependent => :destroy
  has_many   :taggings , :dependent => :destroy
  has_many   :tags, through: :taggings , :dependent => :destroy


  mapping do
    indexes :id, index: :not_analyzed
    indexes :title
    indexes :description
    indexes :price
    indexes :location
    indexes :duration
    indexes :categories, type: 'nested' do
      indexes :id,   type: 'integer'
      indexes :name, type: 'string', index: :not_analyzed
    end
    indexes :tags, type: 'nested' do
      indexes :id,   type: 'integer'
      indexes :name, type: 'string', index: :not_analyzed

    end
    indexes :users, type: 'nested' do
      indexes :id,   type: 'integer'
      indexes :name, type: 'string', index: :not_analyzed
    end
  end

#title, description , price, duration, location, category_id, document, tag_list, worker
  def as_indexed_json(options = {})
    self.as_json(only: [:id, :title, :description, :price, :location, :duration],
                 include: {
                     category:  { only: [:id, :name] },
                     tags: { only: [:id, :name], through: :taggings},
                     user: { only: [:id, :name] },
                 })
  end


  class << self
    def custom_search(query)
      __elasticsearch__.search(query: multi_match_query(query))
    end

    def multi_match_query(query)
      {
          multi_match: {
              query: query,
              type: "best_fields",
              fields: ["title^10", "description^8", "price", "price", "location^6", "categories.name^9","tags.name"],
              operator: "and" ,
          }
      }
    end
  end


  class RelationError < StandardError
    def initialize(msg = "That Relationship Type doesn't exist")
      super(msg)
    end
  end

  def add_many(type, data)
    if type.in? %w'category', 'bid', 'tags', 'user'
      # movie.genres = [data]
      self.send("#{type.downcase.pluralize}=", data.map do |g|
                                               type.classify.constantize.where(name: g).first_or_create!
                                             end)
    else
      raise RelationError
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).jobs
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
        joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end