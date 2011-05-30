class PagesController < ApplicationController
  def home
    @title = "Home"
    @today_events = Event.for_today
    @tomorrow_events = Event.for_tomorrow
    @week_events = Event.from_two_days_later.for_this_week
  end

  def about
  end

  def faq
  end

end
