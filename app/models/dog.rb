class Dog < ApplicationRecord
  serialize :color, Array

  belongs_to :user
  has_many :favorites, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  mount_uploaders :pictures, PictureUploader

  validates :name, :breed, presence: true
  validates :size, inclusion: { in: %w(small medium large) }
  validates :gender, inclusion: { in: %w(male female) }
  validates :is_hypoallergenic, inclusion: { in: [true, false] }
  validates :is_sterilized, inclusion: { in: [true, false] }

  COLORS = ["white", "black", "beige", "gray", "brown", "orange", "golden"]
  GENDERS = ["male", "female"]
  SIZES = ["small", "medium", "large"]
  YES_AND_NO = ["yes", "no"]
  BREEDS = ["Norrbottenspets", "Old English Sheepdog", "Parson Russell Terrier", "Pomeranian", "Rottweiler", "Russell Terrier", "Akita", "Beagle", "French Bulldog", "Dalmatian", "German Sheperd", "Labrador", "Maltese", "Dachshund", "Doberman", "Chihuahua"]

end
