require "test_helper"

class OnboardingControllerTest < ActionDispatch::IntegrationTest
  test "should get step1" do
    get onboarding_step1_url
    assert_response :success
  end

  test "should get step2" do
    get onboarding_step2_url
    assert_response :success
  end

  test "should get step3" do
    get onboarding_step3_url
    assert_response :success
  end

  test "should get save_step1" do
    get onboarding_save_step1_url
    assert_response :success
  end

  test "should get save_step2" do
    get onboarding_save_step2_url
    assert_response :success
  end

  test "should get save_step3" do
    get onboarding_save_step3_url
    assert_response :success
  end
end
