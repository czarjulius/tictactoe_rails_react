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
  context "new_game" do
    it "creates a new_game" do
      headers = { "ACCEPT" => "application/json" }
      post "/new_game", :params => { :game => {:opponent => "computer", :current_player => 'human'} }, :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:created)
    end
    it "fails to creates a new_game" do
      headers = { "ACCEPT" => "application/json" }
      post "/new_game", :params => { :game => {:oppogdgdnent => "computer"} }, :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response.body).to include('error')
    end
  end
end