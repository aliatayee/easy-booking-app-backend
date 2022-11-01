class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :query_resesrvation, except: :mine

  def mine
    render(
      json: current_user
        .reservations
        .includes(room: %i[room_type room_accomodations accomodations])
    )
  end

  def update
    is_updated = @reservation.update(update_params)
    return respond_unprocessable(@reservation) unless is_updated

    render(
      json: {
        reservation: ReservationSerializer.new(@reservation),
        message: 'Reservation updated successfully!'
      }
    )
  end

  def destroy
    @reservation.destroy
    render(json: { message: 'Reservation canceled successfully!' })
  end

  private

  def update_params
    params.require(:reservation).permit(:from_date, :to_date)
  end

  def query_resesrvation
    @reservation = current_user.reservations.find(params[:id])
  rescue StandardError
    respond_not_found
  end
end