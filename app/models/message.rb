class Message < ApplicationRecord
  belongs_to :shelter, class_name: "User", foreign_key: "to_user_id"
  belongs_to :from, class_name: "User", foreign_key: "from_user_id"

  validates :from_user_id, presence: true
  validates :to_user_id, presence: true
  validates :content, presence: true
end
