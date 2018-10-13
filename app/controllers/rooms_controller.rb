class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:'show.html.erb', :edit, :update, :destroy]

  def index
  end

  def show
    @reservation = current_user.reservations.new(room: @room)
  end

  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private


  def room_params
    params.require(:room)
    .permit(
        :home_type,
        :room_type,
        :accommodate,
        :bedroom_number,
        :bathroom_number,
        :price,
        :title,
        :description,
        :location,
        :image
    )
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
