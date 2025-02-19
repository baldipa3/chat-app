require "rails_helper"

RSpec.describe RoomsController, type: :request do
  let(:user) { FactoryBot.build(:user) }
  before { sign_in user, scope: :user }

  describe "GET #index" do
    let!(:rooms) { FactoryBot.create_list(:room, 3) }

    before do
      get "/rooms"
    end

    it "returns a successful response" do
      expect(response).to have_http_status(:ok)
    end

    it "displays the list of rooms" do
      rooms.each do |room|
        expect(response.body).to include(room.name)
      end
    end
  end

  describe "GET #show" do
    let!(:room) { FactoryBot.create(:room) }

    before do
      get "/rooms/#{room.id}"
    end

    it "returns a successful response" do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    let!(:room) { FactoryBot.create(:room) }

    context "with valid params" do
      let(:params) { { room: { name: "A room" } } }

      it "expect the creation of a room" do
        expect { post "/rooms", params: params }.to change(Room, :count).by 1
      end
    end

    context "with invalid params" do
      let(:params) { { room: { name: nil } } }

      it "does not create a new room" do
        expect { post "/rooms", params: params }.not_to change(Room, :count)
      end
    end
  end
end
