require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:room) { FactoryBot.create(:room) }

  it "broadcast message content to room after creation" do
    expect { Message.create!(content: 'Hello', room: room, user: user) }
      .to have_broadcasted_to(room.to_gid_param).from_channel(Turbo::StreamsChannel)
  end
end
