class Dog < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  mount_uploaders :pictures, PictureUploader
end
