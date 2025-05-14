class FlightsController < ApplicationController
  def index
    @flights = Flight.all.order(:departure_time)
    @airports_options = Airport.distinct.order(:code).map { |a| [ a.code, a.id ] }
    @num_tickets_options = (1..4)
    @date_options = Flight.distinct.pluck(:departure_time).map(&:to_date).sort
  end
end
