class ConverterController < ApplicationController
  def index
    def index
      @date = unless [nil , ''].include?(params[:date])
        Date.parse params[:date]
      end
  
      @expiration_date = unless [nil , ''].include? params[:expiration_date]
        Date.parse params[:expiration_date] 
      end
  
      @storage_life = unless [nil, ''].include? params[:storage_life]
        params[:storage_life].to_i
      end
  
      if @date and @expiration_date
        difference = @expiration_date - @date
        @date_of_60_precent = @date + (difference * 0.6).ceil
      elsif @date and @storage_life
        @date_of_60_precent = @date + (@storage_life * 0.6).ceil
      end
    end
  end
end
