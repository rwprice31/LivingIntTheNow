require 'test_helper'

class PositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position = positions(:one)
    #@user = User.create(email: "example@fake-email.com", password: Devise::Encryptor.digest(User, "helloworld"), firstName: "John", lastName: "Smith", phone: "7705559998", active: true, admin: true)
    @user = users(:one)
  end

  test "should get index" do
    sign_in @user
    get positions_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_position_url
    assert_response :success
  end

  test "should create position" do
    sign_in @user
    assert_difference('Position.count') do
      post positions_url, params: { position: { acceptDenyShift: @position.acceptDenyShift, editSchedule: @position.editSchedule, name: @position.name, scheduleable: @position.scheduleable, store_id: @position.store_id } }
    end

    assert_redirected_to position_url(Position.last)
  end

  test "should show position" do
    sign_in @user
    get position_url(@position)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_position_url(@position)
    assert_response :success
  end

  test "should update position" do
    sign_in @user
    patch position_url(@position), params: { position: { acceptDenyShift: @position.acceptDenyShift, editSchedule: @position.editSchedule, name: @position.name, scheduleable: @position.scheduleable, store_id: @position.store_id } }
    assert_redirected_to position_url(@position)
  end

  test "should destroy position" do
    assert_difference('Position.count', -1) do
      delete position_url(@position)
    end

    assert_redirected_to positions_url
  end
end
