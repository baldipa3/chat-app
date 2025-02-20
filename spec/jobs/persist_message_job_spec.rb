require 'rails_helper'

RSpec.describe PersistMessageJob, type: :job do
  let(:user) { FactoryBot.create(:user) }
  let(:room) { FactoryBot.create(:room) }
  let(:content) { Faker::Lorem.sentence }

  subject(:perform) { described_class.new.perform(user.id, room.id, content) }

  it "creates a new Message" do
    expect { perform }.to change { Message.count }.by(1)
  end
end
