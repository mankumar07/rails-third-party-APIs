class Api::V1::RepositoriesController < ApplicationController
  def get_user
    result = RestClient.get(User::BASE_URI + "/#{params[:username]}")
    user = User.user_create(JSON.parse(result)["login"])
    render json: user
  end

  def get_repository
    # byebug
    result = RestClient.get(User::BASE_URI + "/#{params[:username]}/repos")
    repository = Repository.repository_create(result)
    # byebug
    render json: repository
  end
end

