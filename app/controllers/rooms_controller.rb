class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.append("rooms-list", partial: "room", locals: { room: @room }),
            turbo_stream.remove("modal")
          ]
        }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("modal", partial: "rooms/new", locals: { room: @room })
        }
      end
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
