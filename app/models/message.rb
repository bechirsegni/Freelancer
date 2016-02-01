class Message < ActiveRecord::Base
  belongs_to :conversation , dependent: :destroy
  belongs_to :user , dependent: :destroy

  validates_presence_of :body, :conversation_id, :user_id
end