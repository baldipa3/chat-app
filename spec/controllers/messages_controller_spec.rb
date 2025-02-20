require 'rails_helper'

RSpec.describe MessagesController, type: :request do
  let(:user) { FactoryBot.build(:user) }
  before { sign_in user, scope: :user }

  describe "POST /create" do
    let(:room) { FactoryBot.create(:room) }
    let(:params) do
      {
        message: {
          room_id: room.id,
          content: content
        }
      }
    end

    context "with valid params" do
      let(:content) { Faker::Lorem.sentence }

      it "schedules PersistMessageJob" do
        expect { post "/rooms/#{room.id}/messages", params: params }
          .to have_enqueued_job(PersistMessageJob)
      end

      it "renders the turbo_stream update for message_form" do
        post "/rooms/#{room.id}/messages", params: params, as: :turbo_stream

        expect(response.body).to include('<turbo-stream action="update" target="message_form">')
      end
    end

    context "with invalid params" do
      let(:content) { nil }

      it "renders the turbo_stream replace for message_form" do
        post "/rooms/#{room.id}/messages", params: params, as: :turbo_stream

        expect(response.body).to include('<turbo-stream action="replace" target="message_form">')
      end
    end
  end
end
