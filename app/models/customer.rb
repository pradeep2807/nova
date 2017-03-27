class Customer < ActiveRecord::Base
  belongs_to :tenant
  validates_uniqueness_of :mobileno
  validate :free_plan_can_only_have_one_project


	def free_plan_can_only_have_one_project
		if self.new_record? && (tenant.customers.count > 0) && (tenant.plan == 'free')
			errors.add(:base, "Free plans can not have more then one project")
		end
	end

	def self.by_plan_and_tenant(tenant_id)
		tenant = Tenant.find(tenant_id)
		if tenant.plan == 'free'
			tenant.customers
		else
			tenant.customers
		end
	end
end
