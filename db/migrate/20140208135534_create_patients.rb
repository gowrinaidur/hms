class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :phone_number
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :email
      t.float :height
      t.float :weight

      t.timestamps
    end
  end
end
