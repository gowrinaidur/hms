class Doctor < ActiveRecord::Base
  attr_accessible :birth_date, :clinic_city, :clinic_name, :clinic_phone_no, :clinic_state, :clinic_street_address, :clinic_zip_code, :description, :first_name, :last_name
  has_one :user ,:as=>:accountable,:dependent=>:destroy

  validates :birth_date, :presence => true
end
