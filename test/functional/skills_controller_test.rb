require 'test_helper'

class SkillsControllerTest < ActionController::TestCase
  test "should get armor" do
    get :armor
    assert_response :success
  end

  test "should get felyne" do
    get :felyne
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
