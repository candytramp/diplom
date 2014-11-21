require 'rails_helper'

RSpec.describe "ConferencePeople", :type => :request do
  describe "GET /conference_people" do
    it "works! (now write some real specs)" do
      get conference_people_path
      expect(response.status).to be(200)
    end
  end
end
