class AddAccountableToUsers < ActiveRecord::Migration
  def change
  	remove_column :doctors , :email
  	remove_column :patients, :email
  	add_column :users, :accountable_type, :string
  	add_column :users, :accountable_id, :integer
  end
end
