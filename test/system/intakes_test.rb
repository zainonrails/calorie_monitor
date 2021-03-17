require "application_system_test_case"

class IntakesTest < ApplicationSystemTestCase
  setup do
    @intake = intakes(:one)
  end

  test "visiting the index" do
    visit intakes_url
    assert_selector "h1", text: "Intakes"
  end

  test "creating a Intake" do
    visit intakes_url
    click_on "New Intake"

    fill_in "Calories", with: @intake.calories
    fill_in "Eatable", with: @intake.eatable_id
    fill_in "Eatable type", with: @intake.eatable_type
    fill_in "Quantity", with: @intake.quantity
    fill_in "Time", with: @intake.time
    click_on "Create Intake"

    assert_text "Intake was successfully created"
    click_on "Back"
  end

  test "updating a Intake" do
    visit intakes_url
    click_on "Edit", match: :first

    fill_in "Calories", with: @intake.calories
    fill_in "Eatable", with: @intake.eatable_id
    fill_in "Eatable type", with: @intake.eatable_type
    fill_in "Quantity", with: @intake.quantity
    fill_in "Time", with: @intake.time
    click_on "Update Intake"

    assert_text "Intake was successfully updated"
    click_on "Back"
  end

  test "destroying a Intake" do
    visit intakes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intake was successfully destroyed"
  end
end
