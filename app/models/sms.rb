class Sms < ActiveRecord::Base

	def client
    	Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_token
  	end

  	acct_sid = "ACcb29481e59f17f335460d737191225ff"
  	auth_token = "6c77ba8ffb2d1c9d823bc1894950a6cc"
  	twilio_no = "+16312010201"
  	acct_sid = ENV['twilio_account_sid']
  	auth_token = ENV['twilio_token']
  	twilio_no = ENV['twilio_no']

  	
	def send_sms () 
		Rails.logger.info(mobileno) 
		client.account.messages.create( 
		:messaging_service_sid => Rails.application.secrets.twilio_messaging_service_sid, 
		:from => "+16312010201", 
		:to => mobileno, 
		:body => "Hi. Thanks a lot for signing up with us. Your UID is: #{uid}" 
		) 
	end
end
