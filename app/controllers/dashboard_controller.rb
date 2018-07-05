class DashboardController < ApplicationController
  def index
    today = Date.today
    # current_month = Date::MONTHNAMES[today.month]
    # default_month = current_month

    if params[:filter_date].present?
    else
      filter_date = today
    end

    start_date = filter_date.beginning_of_month.strftime("%Y-%m-%d")
    end_date = filter_date.end_of_month.strftime("%Y-%m-%d")

    outcome = Outcome.by_outcome_date.all
    
    month_outcome = []

    (outcome || []).each do |out_come|
      if out_come[:outcome_date].to_datetime >= start_date && out_come[:outcome_date].to_datetime <= end_date
        month_outcome << out_come
      end
    end

    @month_deaths = month_outcome.count
    @total_died = outcome.count
  end
end
