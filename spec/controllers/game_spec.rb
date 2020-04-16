require "rails_helper"

RSpec.describe GameController, :type => :controller do
    describe "GET index" do
      it "has a 200 status code" do
        get :index
        expect(response.status).to eq(200)
      end
    end
end

RSpec.describe "Game Controller", :type => :request do
  context "opponent" do
    it "creates an opponent" do
      headers = { "ACCEPT" => "application/json" }
      post "/opponent", :params => { :games => {:opponent => "computer"} }, :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:created)
    end
  end
end