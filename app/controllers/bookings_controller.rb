class BookingsController < ApplicationController
  def new
    @Booking = Booking.new
  end
end
