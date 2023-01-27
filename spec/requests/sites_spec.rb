require 'rails_helper'

RSpec.describe "Sites", type: :request do
  describe "GET /" do
    it "works" do
      get root_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("Girlveloper")
      
    end
  end
end
