require 'spec_helper'

describe Rsvp do
  before(:each) do
    @user = Factory(:user)
    @event = Factory(:event)
    @rsvp = @user.rsvps.build(:event_id => @event.id)
  end

  it "should create a new rsp given valid attributes" do
    @rsvp.save!
  end
end
