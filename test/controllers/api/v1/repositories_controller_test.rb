require "test_helper"

class Api::V1::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get get_user" do
    get api_v1_repositories_get_user_url
    assert_response :success
  end

  test "should get get_repository" do
    get api_v1_repositories_get_repository_url
    assert_response :success
  end
end
