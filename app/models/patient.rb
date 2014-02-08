class Patient < ActiveRecord::Base
  attr_accessible :birth_date, :city, :email, :first_name, :height, :last_name, :phone_number, :state, :street_address, :weight, :zip_code
end
