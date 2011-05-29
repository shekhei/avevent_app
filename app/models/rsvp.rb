class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  attr_accessible :event_id, :notes
end
