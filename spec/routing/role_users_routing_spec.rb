require "rails_helper"

RSpec.describe RoleUsersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/role_users").to route_to("role_users#index")
    end

    it "routes to #new" do
      expect(:get => "/role_users/new").to route_to("role_users#new")
    end

    it "routes to #show" do
      expect(:get => "/role_users/1").to route_to("role_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/role_users/1/edit").to route_to("role_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/role_users").to route_to("role_users#create")
    end

    it "routes to #update" do
      expect(:put => "/role_users/1").to route_to("role_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/role_users/1").to route_to("role_users#destroy", :id => "1")
    end

  end
end
