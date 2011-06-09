class Photo < ActiveRecord::Base
  attr_accessible :event_id, :name, :image, :remote_image_url
  belongs_to :event
  mount_uploader :image, ImageUploader
end
