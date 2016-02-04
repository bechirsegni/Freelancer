class Category < ApplicationRecord
  has_many :jobs
  belongs_to :category
  has_many :children, :dependent => :destroy, :class_name => 'Category'
  end
