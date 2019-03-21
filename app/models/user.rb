class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, if: :verify_shelter
  validates :phone, presence: true, format: { with: /\S+/}, if: :verify_shelter
  validates :address, presence: true, if: :verify_shelter
  validates :name, presence: true, if: :verify_user
  validates :role, inclusion: { in: %w(shelter user) }
  validates :username, presence: true, uniqueness: true

  def verify_shelter
    self.role == 'shelter'
  end

  def verify_user
    self.role == 'user'
  end
end
