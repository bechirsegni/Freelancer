class Bid < ApplicationRecord
  belongs_to :user,dependent: :destroy
  belongs_to :job ,dependent: :destroy
end
