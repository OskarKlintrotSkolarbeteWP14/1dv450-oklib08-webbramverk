require 'test_helper'

module ApikeyDashboard
  class UsersControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should get create" do
      get :create
      assert_response :success
    end

  end
end
