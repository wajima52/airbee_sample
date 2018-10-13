class ReservationsController < ApplicationController
  before_action :set_room

  def create
    @reservation = current_user.reservations.new(reservation_params.merge(room: @room))
    if @reservation.save
      redirect_to room_path(@room), notice: '予約を完了しました。'
    else
      redirect_to room_path(@room), alert: @reservation.errors.full_messages.first
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date)
  end
  def set_room
    @room = Room.find(params[:room_id])
  end
end
