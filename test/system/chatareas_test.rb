require "application_system_test_case"

class ChatareasTest < ApplicationSystemTestCase
  setup do
    @chatarea = chatareas(:one)
  end

  test "visiting the index" do
    visit chatareas_url
    assert_selector "h1", text: "Chatareas"
  end

  test "creating a Chatarea" do
    visit chatareas_url
    click_on "New Chatarea"

    fill_in "5", with: @chatarea.5
    fill_in "Default", with: @chatarea.default
    fill_in "Name", with: @chatarea.name
    fill_in "User limit", with: @chatarea.user_limit
    click_on "Create Chatarea"

    assert_text "Chatarea was successfully created"
    click_on "Back"
  end

  test "updating a Chatarea" do
    visit chatareas_url
    click_on "Edit", match: :first

    fill_in "5", with: @chatarea.5
    fill_in "Default", with: @chatarea.default
    fill_in "Name", with: @chatarea.name
    fill_in "User limit", with: @chatarea.user_limit
    click_on "Update Chatarea"

    assert_text "Chatarea was successfully updated"
    click_on "Back"
  end

  test "destroying a Chatarea" do
    visit chatareas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chatarea was successfully destroyed"
  end
end
