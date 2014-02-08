require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, patient: { birth_date: @patient.birth_date, city: @patient.city, email: @patient.email, first_name: @patient.first_name, height: @patient.height, last_name: @patient.last_name, phone_number: @patient.phone_number, state: @patient.state, street_address: @patient.street_address, weight: @patient.weight, zip_code: @patient.zip_code }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should show patient" do
    get :show, id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient
    assert_response :success
  end

  test "should update patient" do
    put :update, id: @patient, patient: { birth_date: @patient.birth_date, city: @patient.city, email: @patient.email, first_name: @patient.first_name, height: @patient.height, last_name: @patient.last_name, phone_number: @patient.phone_number, state: @patient.state, street_address: @patient.street_address, weight: @patient.weight, zip_code: @patient.zip_code }
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_path
  end
end
