class Article < ApplicationRecord
  belongs_to :user , dependent: :destroy
end
