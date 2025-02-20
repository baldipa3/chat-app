class PersistMessageJob < ApplicationJob
  queue_as :default

  def perform(user_id, room_id, content)
    Message.create!(user_id: user_id, room_id: room_id, content: content)
  end
end
