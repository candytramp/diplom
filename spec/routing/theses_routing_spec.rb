require "rails_helper"

RSpec.describe ThesesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/theses").to route_to("theses#index")
    end

    it "routes to #new" do
      expect(:get => "/theses/new").to route_to("theses#new")
    end

    it "routes to #show" do
      expect(:get => "/theses/1").to route_to("theses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/theses/1/edit").to route_to("theses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/theses").to route_to("theses#create")
    end

    it "routes to #update" do
      expect(:put => "/theses/1").to route_to("theses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/theses/1").to route_to("theses#destroy", :id => "1")
    end

  end
end
