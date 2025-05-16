class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: :Airport
  belongs_to :arrival_airport, class_name: :Airport
  has_many :bookings

  def self.search(params)
    flights = Flight.all
    flights = flights.where(departure_time: params[:date]) unless params[:date].empty?
    flights.where(departure_airport_id: params[:departure_code],
                  arrival_airport_id: params[:arrival_code])
  end
end
