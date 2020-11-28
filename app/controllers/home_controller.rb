class HomeController < ApplicationController
  def index
  end

  def about
  end
 def zipcode
  	@zip_query = params[:zipcode]
  	
  	if params[:zipcode] == ""
      @zip_query = "Hey you forgot to enter a zipcode!"
    elsif params[:zipcode]
      # Do Api stuff

      require 'net/http'
      require 'json'


      @url = 'http://api.openweathermap.org/data/2.5/weather?zip='+ @zip_query +'&appid=729b0a1135e4c434d0967f6c0c7b86d7'
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)
      @name = @output['name']
    
    # Check for empty return result   
      if @output.empty?
        @final_output = "Error"
      elsif !@output
        @final_output = "Error"
      else
      	@final_output = ((@output['main']['temp'] - 273.15) * 9/5 +32).round(2)
  	end
    
	end
end
end