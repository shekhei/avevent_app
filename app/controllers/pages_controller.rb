class PagesController < ApplicationController
  def home
    @title = "Home"
    @todayevents = Event.show_today

  end

  def about
  end

  def faq
  end

end
