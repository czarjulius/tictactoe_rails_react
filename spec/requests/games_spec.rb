require "rails_helper"

RSpec.describe "Games Controller", :type => :request do
    context "create game" do
      it "creates a game" do
        headers = { "ACCEPT" => "application/json" }
        post '/games', :params => { :game => {:opponent => "computer", :current_player => 'human'} }, :headers => headers
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:created)
      end
      it "fails to creates a game" do
        headers = { "ACCEPT" => "application/json" }
        post '/games', :params => { :game => {:oppogdgdnent => "computer"} }, :headers => headers
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response.body).to include('error')
      end
    end
  end