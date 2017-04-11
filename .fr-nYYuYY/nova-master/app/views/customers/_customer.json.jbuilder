json.extract! customer, :id, :name, :dob, :building, :subarea, :locality, :pin, :emailid, :mobileno, :bg, :diseases, :medicin, :allergy, :tenant_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
