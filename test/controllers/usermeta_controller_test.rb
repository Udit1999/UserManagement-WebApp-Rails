require 'test_helper'

class UsermetaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usermetum = usermeta(:one)
  end

  test "should get index" do
    get usermeta_url
    assert_response :success
  end

  test "should get new" do
    get new_usermetum_url
    assert_response :success
  end

  test "should create usermetum" do
    assert_difference('Usermetum.count') do
      post usermeta_url, params: { usermetum: { email: @usermetum.email, name: @usermetum.name, usertype: @usermetum.usertype } }
    end

    assert_redirected_to usermetum_url(Usermetum.last)
  end

  test "should show usermetum" do
    get usermetum_url(@usermetum)
    assert_response :success
  end

  test "should get edit" do
    get edit_usermetum_url(@usermetum)
    assert_response :success
  end

  test "should update usermetum" do
    patch usermetum_url(@usermetum), params: { usermetum: { email: @usermetum.email, name: @usermetum.name, usertype: @usermetum.usertype } }
    assert_redirected_to usermetum_url(@usermetum)
  end

  test "should destroy usermetum" do
    assert_difference('Usermetum.count', -1) do
      delete usermetum_url(@usermetum)
    end

    assert_redirected_to usermeta_url
  end
end
