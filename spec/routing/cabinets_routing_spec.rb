require "rails_helper"

RSpec.describe CabinetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cabinets").to route_to("cabinets#index")
    end

    it "routes to #show" do
      expect(get: "/cabinets/1").to route_to("cabinets#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cabinets").to route_to("cabinets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cabinets/1").to route_to("cabinets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cabinets/1").to route_to("cabinets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cabinets/1").to route_to("cabinets#destroy", id: "1")
    end
  end
end
