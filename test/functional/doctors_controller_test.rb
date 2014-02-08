require 'test_helper'

class DoctorsControllerTest < ActionController::TestCase
  setup do
    @doctor = doctors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doctors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doctor" do
    assert_difference('Doctor.count') do
      post :create, doctor: { birth_date: @doctor.birth_date, clinic_city: @doctor.clinic_city, clinic_name: @doctor.clinic_name, clinic_phone_no: @doctor.clinic_phone_no, clinic_state: @doctor.clinic_state, clinic_street_address: @doctor.clinic_street_address, clinic_zip_code: @doctor.clinic_zip_code, description: @doctor.description, email: @doctor.email, first_name: @doctor.first_name, last_name: @doctor.last_name }
    end

    assert_redirected_to doctor_path(assigns(:doctor))
  end

  test "should show doctor" do
    get :show, id: @doctor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doctor
    assert_response :success
  end

  test "should update doctor" do
    put :update, id: @doctor, doctor: { birth_date: @doctor.birth_date, clinic_city: @doctor.clinic_city, clinic_name: @doctor.clinic_name, clinic_phone_no: @doctor.clinic_phone_no, clinic_state: @doctor.clinic_state, clinic_street_address: @doctor.clinic_street_address, clinic_zip_code: @doctor.clinic_zip_code, description: @doctor.description, email: @doctor.email, first_name: @doctor.first_name, last_name: @doctor.last_name }
    assert_redirected_to doctor_path(assigns(:doctor))
  end

  test "should destroy doctor" do
    assert_difference('Doctor.count', -1) do
      delete :destroy, id: @doctor
    end

    assert_redirected_to doctors_path
  end
end
