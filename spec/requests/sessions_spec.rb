require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /login" do

    let(:user) { create(:user) }

    it 'authenticates the user and returns a success response' do
      post '/login', params: { first_name: user.first_name , password_digest: user.password_digest }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include('token')
    end

    it 'does not authenticate the user and returns an error' do
      post '/login', params: { first_name: user.first_name, password_digest: 'wrong password'}
      expect(response).to have_http_status(:unathorized)
    end
  end
end
