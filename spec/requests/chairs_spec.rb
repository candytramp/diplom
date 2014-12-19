require 'rails_helper'

RSpec.describe "Chairs", :type => :request do
  describe "GET /chairs" do
    it "works! (now write some real specs)" do
      get chairs_path
      expect(response.status).to be(200)
    end
  end
end
