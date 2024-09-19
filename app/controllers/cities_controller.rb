class CitiesController < ApplicationController
  def index
    @cities = City.order_by_elo
  end
end
