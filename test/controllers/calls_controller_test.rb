require 'test_helper'

class CallsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get calls_new_url
    assert_response :success
  end

  test "should get create" do
    get calls_create_url
    assert_response :success
  end

end
