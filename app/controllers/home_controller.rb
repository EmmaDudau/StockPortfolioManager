class HomeController < ApplicationController
  def index
      @api = StockQuote::Stock.new(api_key: 'pk_f1efbd43a05e4190bd52e0d4a8d2e30a')
      
        	if params[:ticker] == ""
  		@nothing = "Please enter a symbol."
  	elsif params[:ticker]
  		@stock = StockQuote::Stock.quote(params[:ticker])
  		if !@stock 
  			@error = "This stock does not exist."
  		end

  	end

  end

end
