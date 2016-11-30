require 'test_helper'

class StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store = stores(:one)
    # @user = User.create(email: "example@fake-email.com", password: Devise::Encryptor.digest(User, "helloworld"), firstName: "John", lastName: "Smith", phone: "7705559998", active: true, admin: true)
    @user = users(:one)
  end

  test "should get index" do
    sign_in @user
    get stores_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_store_url
    assert_response :success
  end

  test "should create store" do
    sign_in @user
    assert_difference('Store.count') do
      post stores_url, params: { store: { address: @store.address, companyName: @store.companyName, email: @store.email, zipCode: @store.zipCode } }
    end

    assert_redirected_to store_url(Store.last)
  end

  test "should show store" do
    sign_in @user
    get store_url(@store)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_store_url(@store)
    assert_response :success
  end

  test "should update store" do
    sign_in @user
    patch store_url(@store), params: { store: { address: @store.address, companyName: @store.companyName, email: @store.email, zipCode: @store.zipCode } }
    assert_redirected_to store_url(@store)
  end

  test "should destroy store" do
    sign_in @user
    assert_difference('Store.count', -1) do
      delete store_url(@store)
    end

    assert_redirected_to stores_url
  end
end
