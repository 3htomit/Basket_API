require "test_helper"

class BasketControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get basket_index_url
    assert_response :success
  end

  test "should get show" do
    get basket_show_url
    assert_response :success
  end

  test "should get create" do
    get basket_create_url
    assert_response :success
  end
end
