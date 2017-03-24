class ChangeIntegerLimitInYourTable < ActiveRecord::Migration
  def change
  	     change_column :customers, :mobileno, :integer, limit: 8
  end
end
