class DashboardController < ApplicationController
  def index
    current_district = 'Lilongwe' # to be made dynamic
    current_ta = 'Mtema' # to be made dynamic
    total_ta_people = Person.current_district_ta.key([current_district,current_ta]).all.each
    today = Date.today
    # current_month = Date::MONTHNAMES[today.month]
    # default_month = current_month

    if params[:filter_date].present?
      filter_date = params[:filter_date].to_date
    else
      filter_date = today
    end

    start_date = filter_date.beginning_of_month.strftime("%Y-%m-%d")
    end_date = filter_date.end_of_month.strftime("%Y-%m-%d")

    #========= outcome =====================================================================================
    outcome = Outcome.by_outcome_date.all
    
    month_outcome = []

    (outcome || []).each do |out_come|
      if out_come[:outcome_date].to_datetime >= start_date && out_come[:outcome_date].to_datetime <= end_date
        month_outcome << out_come
      end
    end

    @month_deaths = month_outcome.count
    @total_died = outcome.count
    #========================================================================================================

    #========== births ==================================================================================
    start_birthdate = filter_date.beginning_of_month.strftime("%Y/%m/%d")
    end_birthdate = filter_date.end_of_month.strftime("%Y/%m/%d")
    ta_month_births = []
    
    (total_ta_people || []).each do |ta_person|
      begin 
        if !ta_person[:birthdate].nil?
          if ta_person[:birthdate].to_date.strftime("%Y/%m/%d") >= start_birthdate && ta_person[:birthdate].to_date.strftime("%Y/%m/%d") <= end_birthdate
            ta_month_births << ta_person
          end
        end
      rescue
        next
      end
    end

    @month_births = ta_month_births.count
		#startdate = params[:start_date].to_date.strftime("%Y/#{m}/%d").gsub(/\s+/, '')
		#enddate = params[:end_date].to_date.strftime("%Y/%#{m}/%d").gsub(/\s+/, '')
    #people = Person.by_birthdate.startkey("#{start_birthdate}").endkey("#{end_birthdate}").all.each
    #raise people.inspect
		#render :text => people.to_json and return
    #========================================================================================================

    #=========== population ======================================================================================
    @total_population = total_ta_people.count
    #=============================================================================================================
  end
end
