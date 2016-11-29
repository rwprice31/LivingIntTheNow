require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # @request = requests(:one)
    # @user = User.create(email: "example@fake-email.com", password: Devise::Encryptor.digest(User, "helloworld"), firstName: "John", lastName: "Smith", phone: "7705559998", active: true, admin: true)
    @user = users(:one)
    @schedule = schedules(:one)
    @store = stores(:one)
    
    @request = Request.create(schedule_id: @schedule.id, user_id: @user.id)
  end

  test "should get index" do
    sign_in @user
    get requests_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_request_url
    assert_response :success
  end

  test "should create request" do
    sign_in @user
    assert_difference('Request.count') do
      post requests_url, params: { request: { schedule_id: 1, user_id: 1 } }
    end

    assert_redirected_to schedule_url(@user.id) 
  end

  test "should show request" do
    sign_in @user
    get request_url(@request)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_request_url(@request)
    assert_response :success
  end

  test "should update request" do
    sign_in @user
    patch request_url(@request), params: { request: { schedule_id: 1, user_id: 1 } }
    assert_redirected_to schedule_url(@user.id) 
  end

  test "should destroy request" do
    sign_in @user
    assert_difference('Request.count', -1) do
      delete request_url(@request)
    end

    assert_redirected_to requests_url
  end
end
