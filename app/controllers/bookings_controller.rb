class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @num_tickets = params[:num_tickets].to_i
    @flight = Flight.find(params[:flight_id])
  end
end
