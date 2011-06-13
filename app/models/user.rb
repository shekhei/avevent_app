# == Schema Information
# Schema version: 20110528161010
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  name       :string(255)
#  department :string(255)
#  created_at :datetime
#  updated_at :datetime
#  admin      :boolean
#

class User < ActiveRecord::Base
  has_many :rsvps
  has_many :events, :through => :rsvps
  attr_accessible :name, :email, :department
	has_many :microposts

  #email_regex = /\A[\w+\-.]+@aviva\-asia\.com\z/i
  email_regex = /\A[\w+\-.]+@gmail\.com\z/i
  
  validates :name,       :presence        => true, 
                         :length          => { :maximum => 50 }
  validates :email,      :presence        => true, 
                         :format          => { :with => email_regex, :message => "format is invalid. Please use Aviva email"},
                         :uniqueness      => { :case_sensitive => false }
  validates :department, :presence        => true

  def attending?(event)
    rsvps.find_by_event_id(event)
  end

  def attend!(event, note)
    rsvps.create!(:event_id => event.id, :notes => note )
  end

  def unattend!(event)
    rsvps.find_by_event_id(event).destroy
    #rsvps.create!(:event_id => event.id, :status => 0)
  end

end
