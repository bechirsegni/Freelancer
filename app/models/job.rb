class Job < ApplicationRecord
  has_attached_file :document
  validates_attachment :document, content_type: { content_type: "application/pdf" }

  belongs_to :category
  belongs_to :user,dependent: :destroy
  has_many   :bids
end
