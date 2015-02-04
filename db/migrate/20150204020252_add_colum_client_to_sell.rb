class AddColumClientToSell < ActiveRecord::Migration
  def change
  	add_column :sells, :client_id, :integer
  end
end
