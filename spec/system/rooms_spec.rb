require 'rails_helper'

RSpec.describe "Rooms", type: :system do
  let!(:user) { FactoryBot.create(:user, password: "password123") }

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
end
