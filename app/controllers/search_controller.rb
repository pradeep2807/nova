class SearchController < ApplicationController
  
  	def search
	    if params[:term].nil?
	      @customers = []
	    else
	      @customers = Customer.search params[:term]
	    end
  	end

end