class Customer < ActiveRecord::Base
	require 'elasticsearch/model'
	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks
    
    before_save do
		self.diseases.gsub!(/[\[\]\"]/,"") if attribute_present?("diseases")
	end

  	belongs_to :tenant
  	validates_uniqueness_of :mobileno

	def self.by_plan_and_tenant(tenant_id)
		tenant = Tenant.find(tenant_id)
		if tenant.plan == 'free'
			tenant.customers
		else
			tenant.customers
		end
	end

	def client
    	Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_token
  	end

  	def self.search(query)
	  __elasticsearch__.search(
	    {
	      query: {
	        multi_match: {
	          query: query,
	          fields: ['name', 'text', 'locality', 'text', 'diseases', 'text', 'building' ,'text']
	        }
	      },
	      highlight: {
	        pre_tags: ['<em>'],
	        post_tags: ['</em>'],
	        fields: {
	          title: {},
	          text: {}
	        }
	      }
	    }
	  )
	end

  	acct_sid = "ACcb29481e59f17f335460d737191225ff"
  	auth_token = "6c77ba8ffb2d1c9d823bc1894950a6cc"
  	twilio_no = "+16312010201"
  	acct_sid = ENV['twilio_account_sid']
  	auth_token = ENV['twilio_token']
  	twilio_no = ENV['twilio_no']

  	
	def send_sms ()
		client.account.messages.create( 
		:messaging_service_sid => Rails.application.secrets.twilio_messaging_service_sid, 
		:from => "+16312010201", 
		:to => "+91#{mobileno}", 
		:body => "Hi. Thanks a lot for signing up with Novacure. Your UID is: #{uid}" 
		) 
	end
end
