require 'rails_helper'

RSpec.describe "Sites", type: :request do
  describe "GET /" do
    it "works" do
      get root_path
      expect(response).to have_http_status(302)
      # expect(response.body).to include("Girlveloper")
      # expect(response.body).to include("Log in")
      
    end
    
    it "redirects to sign in page" do
      get root_path
      expect(response).to redirect_to('/users/sign_in')
      # expect(response.body).to include("redirected")
    end
  end
end
