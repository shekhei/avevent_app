# == Schema Information
# Schema version: 20110528161010
#
# Table name: events
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  peak       :string(255)
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
  has_many :rsvps
  has_many :users, :through => :rsvps
  
  attr_accessible :name, :peak, :start_time, :end_time


end
