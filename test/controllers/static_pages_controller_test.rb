require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @user = User.create(email: "example@fake-email.com", password: Devise::Encryptor.digest(User, "helloworld"), firstName: "John", lastName: "Smith", phone: "7705559998", active: true, admin: true)
  end
  
  test "should get home" do
    sign_in @user
    get root_path
    assert_response :success
  end

  test "should get help" do
    sign_in @user
    get '/help'
    assert_response :success
  end

  test "should get about" do
    sign_in @user
    get '/about'
    assert_response :success
  end

  test "should get contact" do
    sign_in @user
    get '/contact'
    assert_response :success
  end

end
