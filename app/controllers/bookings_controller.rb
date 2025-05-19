class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = flight_finder
    @num_tickets = tickets_params
    @num_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = flight_finder
    @num_tickets = tickets_params

    if @booking.save
      flash[:notice] = "Flight booked!"
      redirect_to @booking
    else
      flash.now[:alert] = "Could not book flight!"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, :num_tickets, passengers_attributes: [ :name, :email ])
    end

    def flight_finder
      Flight.find(params[:booking][:flight_id])
    end

    def tickets_params
      params[:booking][:num_tickets].to_i
    end
end
