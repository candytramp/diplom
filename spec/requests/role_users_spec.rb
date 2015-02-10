require 'rails_helper'

RSpec.describe "RoleUsers", :type => :request do
  describe "GET /role_users" do
    it "works! (now write some real specs)" do
      get role_users_path
      expect(response.status).to be(200)
    end
  end
end
