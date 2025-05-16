class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @num_tickets = params[:num_tickets].to_i
    @flight = Flight.find(params[:flight_id])
    @num_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "Flight booked!"
      redirect_to flights_path
    else
      flash.now[:alert] = "Could not book flight!"
      render :new, status: :unprocessable_entity
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, :num_tickets, passengers_attributes: [ :name, :email ])
    end
end
