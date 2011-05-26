require 'spec_helper'

describe User do

  before(:each) do
    @attr = {:name => "Zhou Zhiwei", :email => "hotdog092@aviva-asia.com", :department => "WebDev"}
  end
  
  it "should create a new user instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should require department" do
    no_department_user = User.new(@attr.merge(:department => ""))
    no_department_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[test@aviva-asia.com ADMIN@AVIVA-ASIA.COM good@AvIvA-aSiA.cOm]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@gmail.com hotdog092@gmail.com test@msn.com]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
end
