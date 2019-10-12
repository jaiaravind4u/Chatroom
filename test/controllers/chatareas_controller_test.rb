require 'test_helper'

class ChatareasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chatarea = chatareas(:one)
  end

  test "should get index" do
    get chatareas_url
    assert_response :success
  end

  test "should get new" do
    get new_chatarea_url
    assert_response :success
  end

  test "should create chatarea" do
    assert_difference('Chatarea.count') do
      post chatareas_url, params: { chatarea: { 5: @chatarea.5, default: @chatarea.default, name: @chatarea.name, user_limit: @chatarea.user_limit } }
    end

    assert_redirected_to chatarea_url(Chatarea.last)
  end

  test "should show chatarea" do
    get chatarea_url(@chatarea)
    assert_response :success
  end

  test "should get edit" do
    get edit_chatarea_url(@chatarea)
    assert_response :success
  end

  test "should update chatarea" do
    patch chatarea_url(@chatarea), params: { chatarea: { 5: @chatarea.5, default: @chatarea.default, name: @chatarea.name, user_limit: @chatarea.user_limit } }
    assert_redirected_to chatarea_url(@chatarea)
  end

  test "should destroy chatarea" do
    assert_difference('Chatarea.count', -1) do
      delete chatarea_url(@chatarea)
    end

    assert_redirected_to chatareas_url
  end
end
