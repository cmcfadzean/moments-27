require "application_system_test_case"

class MomentsTest < ApplicationSystemTestCase
  setup do
    @moment = moments(:one)
  end

  test "visiting the index" do
    visit moments_url
    assert_selector "h1", text: "Moments"
  end

  test "creating a Moment" do
    visit moments_url
    click_on "New Moment"

    fill_in "Date", with: @moment.date
    fill_in "Description", with: @moment.description
    fill_in "Title", with: @moment.title
    fill_in "User", with: @moment.user_id
    click_on "Create Moment"

    assert_text "Moment was successfully created"
    click_on "Back"
  end

  test "updating a Moment" do
    visit moments_url
    click_on "Edit", match: :first

    fill_in "Date", with: @moment.date
    fill_in "Description", with: @moment.description
    fill_in "Title", with: @moment.title
    fill_in "User", with: @moment.user_id
    click_on "Update Moment"

    assert_text "Moment was successfully updated"
    click_on "Back"
  end

  test "destroying a Moment" do
    visit moments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Moment was successfully destroyed"
  end
end
