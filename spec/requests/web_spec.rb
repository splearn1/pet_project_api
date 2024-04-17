require 'rails_helper'

RSpec.describe "Webs", type: :request do
  describe "GET /user_data" do
    it "returns http success" do
      get "/web/user_data"
      expect(response).to have_http_status(:success)
    end
  end

end
