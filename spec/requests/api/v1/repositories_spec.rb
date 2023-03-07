require 'rails_helper'

path1 = File.join(File.dirname(__FILE__), 'repositories_stub.json')
first_stub_result = File.open(path1).read

RSpec.describe 'Api::V1::Repositories', type: :request do
  describe 'POST /repositories' do
    subject do
      # byebug
      user = User.create(username:"mankumar07")
      # post('/repositories', params: { username: 'rails' })
      get('/api/v1/mankumar07/repos', params: { username: 'mankumar07' })
    end
    let(:response_json) do
      byebug
      [
        {
          "repository_name": "Inventory_Management_System",
          "stargazers_count": 71
        },
        {
          "name": "actioncable",
          "stargazers_count": 1091
        }
      ]
    end
    before do
      # byebug
      WebMock.stub_request(:get, "https://api.github.com/users/mankumar07/repos").
        with(
          headers: {
            'Accept': '*/*',
            'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent': 'Ruby'
          }
        ).
        to_return(status: 200, body: first_stub_result, headers: {})
      subject
    end
    it "shoud save and render correct results" do
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      # byebug
      expect(json.first["repository_name"]).to eq("Inventory_Management_System")
    end
  end


  # describe 'GET /index' do
  #   before do
  #     FactoryBot.create_list(:inventory, 1)
  #     get '/api/v1/inventories'
  #   end

  #   it 'returns all inventories' do
  #     expect(response.status).to eq(200)
  #   end

  #   it 'returns status code 200' do
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'POST /create' do
  #   context 'with valid parameters' do
  #     before do
  #       post '/api/v1/inventories', params:
  #                                   { inventory: {
  #                                     category_name: 'inventory_fisrt2',
  #                                     description: 'whatever you want'
  #                                   } }
  #     end
  #     it 'returns the category_name' do
  #       expect(JSON.parse(response.body)['category_name']).to eq('inventory_fisrt2')
  #     end

  #     it 'returns the description' do
  #       expect(JSON.parse(response.body)['description']).to eq('whatever you want')
  #     end

  #     it 'returns a created status' do
  #       expect(response).to have_http_status(:created)
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     before do
  #       post '/api/v1/inventories', params:
  #                         { inventory: {
  #                           category_name: '',
  #                           description: ''
  #                         } }
  #     end

  #     it 'returns a unprocessable entity status' do
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end
  #   end
  # end

  # describe 'PUT /update' do
  #   let!(:inventory) { FactoryBot.create(:inventory) }

  #   before do
  #     put "/api/v1/inventories/#{inventory.id}", params: {
  #       inventory: {
  #         category_name: 'inventory_fisrt2',
  #         description: 'whatever you want'
  #       }
  #     }
  #   end

  #   it 'returns status code 200' do
  #     # byebug
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   let!(:inventory) { FactoryBot.create(:inventory) }

  #   before do
  #     delete "/api/v1/inventories/#{inventory.id}"
  #   end

  #   it 'returns status code 204' do
  #     # byebug
  #     expect(response).to have_http_status(204)
  #   end
  # end
end
