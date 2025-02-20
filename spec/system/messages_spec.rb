require 'rails_helper'

RSpec.describe "Messages", type: :system do
  let(:user) { FactoryBot.create(:user, password: "password123") }
  let!(:room) { FactoryBot.create(:room, name: "Test Room") }

  before do
    driven_by :selenium_chrome
    login_as(user)
    ActiveJob::Base.queue_adapter = :inline
  end


  it "shows the message in the room chat when submiting" do
    visit room_path(room)
    fill_in "message_content", with: "Text message!"
    click_button "Send"

    expect(page).to have_selector("#messages", text: "Text message!")
  end
end
