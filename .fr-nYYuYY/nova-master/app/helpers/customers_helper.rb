module CustomersHelper
	def checked(area)
		@customer.diseases.nil? ? false : @customer.diseases.match(area)
	end 
end
