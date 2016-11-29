require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    #@user = User.create(email: "example@fake-email.com", password: Devise::Encryptor.digest(User, "helloworld"), firstName: "John", lastName: "Smith", phone: "7705559998", active: true, admin: true)
    @user = users(:one)
    @user.store = Store.create(email: "example-email@nowhere.com", companyName: "Examples Industrial", address: "123 Example Boulevard", zipCode: "90909")
  end

  test "should get index" do
    sign_in @user
    get users_url
    assert_response :success
  end

  test "should get new" do
    # sign_in @user
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { active: @user.active, admin: @user.admin, email: @user.email, firstName: @user.firstName, lastName: @user.lastName, phone: @user.phone, password: @user.password, store:@user.store } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    sign_in @user
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    sign_in @user
    patch user_url(@user), params: { user: { active: @user.active, admin: @user.admin, email: @user.email, firstName: @user.firstName, lastName: @user.lastName, password: @user.password, phone: @user.phone } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    sign_in @user
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
