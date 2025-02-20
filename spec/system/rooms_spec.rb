require 'rails_helper'

RSpec.describe "Rooms", type: :system do
  let(:user) { FactoryBot.create(:user, password: "password123") }

  before do
    driven_by :selenium_chrome
    login_as(user)
  end

  it "creates a new room and allows clicking on it" do
    visit rooms_path

    click_link "New Room"

    expect(page).to have_css("#modal", visible: true)

    fill_in "Room Name", with: "Test Room"
    click_button "Create Room"

    expect(page).to have_content("Test Room")

    click_link "Test Room"

    expect(page).to have_current_path(room_path(Room.last))
  end

  context "within the room" do
    let!(:room) { FactoryBot.create(:room, name: "Test Room") }

    it "joins the room when clicking on one of them" do
      visit rooms_path

      find("a", text: "Test Room").click

      expect(page).to have_current_path(room_path(room))
    end

    it "leaves the room when clicking on Leave Room" do
      visit room_path(room)

      click_link "Leave Room"

      expect(page).to have_current_path(rooms_path)
    end
  end
end
