# == Schema Information
# Schema version: 20110525101103
#
# Table name: events
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  peak       :string(255)
#  start_time :time
#  end_time   :time
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
end
