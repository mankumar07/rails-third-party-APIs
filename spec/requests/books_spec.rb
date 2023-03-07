require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/books/create"
      expect(response).to have_http_status(:success)
    end
  end

end
