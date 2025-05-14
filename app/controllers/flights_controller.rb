class FlightsController < ApplicationController
  def index
    @airports_options = Airport.distinct.order(:code).map { |a| [ a.code, a.id ] }
    @num_tickets_options = (1..4)
    @date_options = Flight.distinct.pluck(:departure_time).map(&:to_date).sort
    @flights = search_params_present? ? Flight.search(params) : []
  end

  private
    def search_params_present?
      params[:departure_code].present? &&
      params[:arrival_code].present? &&
      params[:num_tickets].present?
    end
end
