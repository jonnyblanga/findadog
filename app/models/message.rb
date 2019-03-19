class Message < ApplicationRecord
  validates :context, length: { in: 1..500 }
  validates :from_user_id, presence: true
  validates :to_user_id, presence: true
end
