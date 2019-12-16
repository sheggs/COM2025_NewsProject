require 'test_helper'

class ContactformsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contactform = contactforms(:one)
  end

  test "should get index" do
    get contactforms_url
    assert_response :success
  end

  test "should get new" do
    get new_contactform_url
    assert_response :success
  end

  test "should create contactform" do
    assert_difference('Contactform.count') do
      post contactforms_url, params: { contactform: { body: @contactform.body, email: @contactform.email, title: @contactform.title } }
    end

    assert_redirected_to contactform_url(Contactform.last)
  end

  test "should show contactform" do
    get contactform_url(@contactform)
    assert_response :success
  end

  test "should get edit" do
    get edit_contactform_url(@contactform)
    assert_response :success
  end

  test "should update contactform" do
    patch contactform_url(@contactform), params: { contactform: { body: @contactform.body, email: @contactform.email, title: @contactform.title } }
    assert_redirected_to contactform_url(@contactform)
  end

  test "should destroy contactform" do
    assert_difference('Contactform.count', -1) do
      delete contactform_url(@contactform)
    end

    assert_redirected_to contactforms_url
  end
end
