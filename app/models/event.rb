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
  scope :for_today, where(:start_time => Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  scope :for_tomorrow, where(:start_time => Time.zone.now.tomorrow.beginning_of_day..Time.zone.now.tomorrow.end_of_day)
  scope :for_this_week, where(:start_time => Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)
  scope :from_two_days_later, where("start_time > ?", Time.zone.now.midnight + 2.day)
  scope :is_active, where("start_time > ?", Time.zone.now.midnight)

end
