class MessagesController < ApplicationController
  before_action :set_room, only: %i[create]

  def create
    if message_params[:content].present? && @room
      PersistMessageJob.perform_later(current_user.id, @room.id, message_params[:content])
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("message_form", partial: "messages/form", locals: { room: @room })
        end
      end
    else
      render turbo_stream: turbo_stream.replace("message_form", partial: "messages/form")
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_room
    @room ||= Room.find_by(id: params[:room_id])
  end
end
