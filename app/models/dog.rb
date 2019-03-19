class Dog < ApplicationRecord
  serialize :color, Array

  belongs_to :user
  mount_uploader :photo, PhotoUploader
  mount_uploaders :pictures, PictureUploader

  validates :name, :breed, presence: true
  validates :size, inclusion: { in: %w(small medium large) }
  validates :gender, inclusion: { in: %w(male female) }
  validates :is_hypoallergenic, inclusion: { in: [true, false] }
  validates :is_sterilized, inclusion: { in: [true, false] }


  validate :colors_match

  def colors_match
    valid_colors = %w(black white gray beige brown orange golden)
    color.each do |color|
      valid_colors.include?(color) ? true : errors.add(:color, "#{color} is not in the array of valid colors - check dog.rb for details")
    end
  end
end


# validates :color, inclusion: { in: %w(black white gray beige brown orange golden) }
# validates_associated :dogs
# validates :is_sterilized, inclusion: { in: [true, false] }
