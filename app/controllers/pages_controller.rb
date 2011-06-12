class PagesController < ApplicationController
  def home
    @title = "Home"
    @today_events = Event.for_today
    @tomorrow_events = Event.for_tomorrow
    @week_events = Event.from_two_days_later.for_this_week
    @month_events = Event.from_this_week_later.for_this_month
  end

  def about
    @title = "About Basecamp"
  end

  def faq
  end
  
  def past
    @past_events = Event.is_past
    @past_events_months = @past_events.group_by { |t| t.start_time.beginning_of_month }
  end
  
  def social
    @title = "Social Event"
    @today_events_social = Event.for_today.peakcat('Social')
    @tomorrow_events_social = Event.for_tomorrow.peakcat('Social')
    @week_events_social = Event.from_two_days_later.for_this_week.peakcat('Social')
    @month_events_social = Event.from_this_week_later.for_this_month.peakcat('Social')
  end

  def financial
    @title = "Financial Event"
    @today_events_financial = Event.for_today.peakcat('Financial')
    @tomorrow_events_financial = Event.for_tomorrow.peakcat('Financial')
    @week_events_financial = Event.from_two_days_later.for_this_week.peakcat('Financial')
    @month_events_financial = Event.from_this_week_later.for_this_month.peakcat('Financial')
  end

  def fit
    @title = "Fit Event"
    @today_events_fit = Event.for_today.peakcat('Fit')
    @tomorrow_events_fit = Event.for_tomorrow.peakcat('Fit')
    @week_events_fit = Event.from_two_days_later.for_this_week.peakcat('Fit')
    @month_events_fit = Event.from_this_week_later.for_this_month.peakcat('Fit')
  end

  def career
    @title = "Career Event"
    @today_events_career = Event.for_today.peakcat('Career')
    @tomorrow_events_career = Event.for_tomorrow.peakcat('Career')
    @week_events_career = Event.from_two_days_later.for_this_week.peakcat('Career')
    @month_events_career = Event.from_this_week_later.for_this_month.peakcat('Career')
  end

  def personal
    @title = "Personal Event"
    @today_events_personal = Event.for_today.peakcat('Personal')
    @tomorrow_events_personal = Event.for_tomorrow.peakcat('Personal')
    @week_events_personal = Event.from_two_days_later.for_this_week.peakcat('Personal')
    @month_events_personal = Event.from_this_week_later.for_this_month.peakcat('Personal')
  end

  def community
    @title = "Community Event"
    @today_events_community = Event.for_today.peakcat('Community')
    @tomorrow_events_community = Event.for_tomorrow.peakcat('Community')
    @week_events_community = Event.from_two_days_later.for_this_week.peakcat('Community')
    @month_events_community = Event.from_this_week_later.for_this_month.peakcat('Community')
  end

  def possibility
    @title = "Possibility Event"
    @today_events_possibility = Event.for_today.peakcat('Possibility')
    @tomorrow_events_possibility = Event.for_tomorrow.peakcat('Possibility')
    @week_events_possibility = Event.from_two_days_later.for_this_week.peakcat('Possibility')
    @month_events_possibility = Event.from_this_week_later.for_this_month.peakcat('Possibility')
  end
end
