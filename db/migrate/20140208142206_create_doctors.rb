class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :clinic_name
      t.string :clinic_street_address
      t.string :clinic_city
      t.string :clinic_state
      t.string :clinic_zip_code
      t.string :email
      t.date :birth_date
      t.string :clinic_phone_no
      t.text :description

      t.timestamps
    end
  end
end
