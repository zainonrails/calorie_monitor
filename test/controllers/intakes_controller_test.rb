require 'test_helper'

class IntakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intake = intakes(:one)
  end

  test "should get index" do
    get intakes_url
    assert_response :success
  end

  test "should get new" do
    get new_intake_url
    assert_response :success
  end

  test "should create intake" do
    assert_difference('Intake.count') do
      post intakes_url, params: { intake: { calories: @intake.calories, eatable_id: @intake.eatable_id, eatable_type: @intake.eatable_type, quantity: @intake.quantity, time: @intake.time } }
    end

    assert_redirected_to intake_url(Intake.last)
  end

  test "should show intake" do
    get intake_url(@intake)
    assert_response :success
  end

  test "should get edit" do
    get edit_intake_url(@intake)
    assert_response :success
  end

  test "should update intake" do
    patch intake_url(@intake), params: { intake: { calories: @intake.calories, eatable_id: @intake.eatable_id, eatable_type: @intake.eatable_type, quantity: @intake.quantity, time: @intake.time } }
    assert_redirected_to intake_url(@intake)
  end

  test "should destroy intake" do
    assert_difference('Intake.count', -1) do
      delete intake_url(@intake)
    end

    assert_redirected_to intakes_url
  end
end
