require 'benchmark'

class DashboardController < ApplicationController
  def index

    benchmark_time = Benchmark.measure {
      current_district = 'Lilongwe' # to be made dynamic
      current_ta = 'Mtema' # to be made dynamic
      total_ta_people = Person.current_district_ta.key([current_district,current_ta]).all.each
      today = Date.today
  
      if params[:filter_date].present?
        filter_date = params[:filter_date].to_date
      else
        filter_date = today
      end
  
      start_date = filter_date.beginning_of_month.strftime("%Y-%m-%d")
      end_date = filter_date.end_of_month.strftime("%Y-%m-%d")
  
      #========= deaths =====================================================================================
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
            if ta_person[:birthdate].to_date.strftime("%Y/%m/%d") >= start_birthdate && ta_person[:birthdate].to_date.strftime("%Y/%m/%d") <= end_birthdate && ta_person[:birthdate].to_date.strftime("%Y/%m/%d") <= today.strftime("%Y/%m/%d")
              ta_month_births << ta_person
            end
          end
        rescue
          next
        end
      end
  
      @month_births = ta_month_births.count

      @births = get_days_of_month(start_date,end_date)
  
      ta_month_births.each do |new_birth|
        births_index = new_birth["birthdate"].to_date.strftime("%d").to_i
        @births[births_index + 1] = @births[births_index + 1] + 1 rescue 0
      end
  
      @total_births = @births.inject(0){|sum,x| sum + x }
      #========================================================================================================
  
      #=========== news read =======================================================================================

      #=============================================================================================================
  
      #=========== new registrations ===============================================================================
      ta_month_registrations = []
      
      (total_ta_people || []).each do |ta_person|
        begin 
          if ta_person[:created_at].to_date.strftime("%Y-%m-%d") >= start_date && ta_person[:created_at].to_date.strftime("%Y-%m-%d") <= end_date && ta_person[:created_at].to_date.strftime("%Y-%m-%d") <= today.strftime("%Y-%m-%d")
            ta_month_registrations << ta_person
          end
        rescue
          next
        end
      end
  
      @month_registrations = ta_month_registrations.count
      
      @registrations = get_days_of_month(start_date,end_date)
  
      ta_month_registrations.each do |new_registration|
        registrations_index = new_registration["created_at"].to_date.strftime("%d").to_i
        @registrations[registrations_index + 1] = @registrations[registrations_index + 1] + 1 rescue 0
      end
  
      @total_new_registrations = @registrations.inject(0){|sum,x| sum + x }
      #=============================================================================================================
  
      #=========== population ======================================================================================
      @total_population = total_ta_people.count
      #=============================================================================================================
    }

    @retrieval_time = benchmark_time.real.to_i
  end

  def get_days_of_month(start_date,end_date)
    # this method is used to create an array of zeroes from first to last day of the given month
    start_day = start_date.to_date.day
    end_day = end_date.to_date.day

    days_of_month = []

    (start_day..end_day).each do |day|
      days_of_month << 0
    end

    return days_of_month

  end
end
