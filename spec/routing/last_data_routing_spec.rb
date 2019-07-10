require "rails_helper"

RSpec.describe LastDataController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/last_data").to route_to("last_data#index")
    end

    it "routes to #new" do
      expect(:get => "/last_data/new").to route_to("last_data#new")
    end

    it "routes to #show" do
      expect(:get => "/last_data/1").to route_to("last_data#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/last_data/1/edit").to route_to("last_data#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/last_data").to route_to("last_data#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/last_data/1").to route_to("last_data#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/last_data/1").to route_to("last_data#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/last_data/1").to route_to("last_data#destroy", :id => "1")
    end
  end
end
