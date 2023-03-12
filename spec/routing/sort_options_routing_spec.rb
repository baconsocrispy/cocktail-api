require "rails_helper"

RSpec.describe SortOptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/sort_options").to route_to("sort_options#index")
    end

    it "routes to #show" do
      expect(get: "/sort_options/1").to route_to("sort_options#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/sort_options").to route_to("sort_options#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/sort_options/1").to route_to("sort_options#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/sort_options/1").to route_to("sort_options#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/sort_options/1").to route_to("sort_options#destroy", id: "1")
    end
  end
end
