class Message < ApplicationRecord
  validates :context, length: { in: 1..500 }
  validates :from_user_id, presence: true
  validates :to_user_id, presence: true

  def sender
    User.find(self.from_user_id)
  end

  def receiver
    User.find(self.to_user_id)
  end
end
