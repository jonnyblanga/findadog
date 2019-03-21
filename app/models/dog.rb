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

  # we will do color validation later inside the css
  # validate :valid_colors


  # def valid_colors
  #    valid_colors = %w(black white gray beige brown orange golden)
  #    error_message = "color is not in the array of valid colors - check dog.rb for details"
  #    (color - valid_colors).each { |color| errors.add(error_message) if color }
  # end

end
