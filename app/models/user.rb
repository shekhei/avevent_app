# == Schema Information
# Schema version: 20110525101103
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  name       :string(255)
#  department :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :department

  email_regex = /\A[\w+\-.]+@aviva\-asia\.com\z/i

  validates :name,       :presence        => true, 
                         :length          => { :maximum => 50 }
  validates :email,      :presence        => true, 
                         :format          => { :with => email_regex },
                         :uniqueness      => { :case_sensitive => false }
  validates :department, :presence        => true

end
