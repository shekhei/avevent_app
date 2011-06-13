class Micropost < ActiveRecord::Base
	attr_accessible :content, :event_id
end
