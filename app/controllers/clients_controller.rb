class ClientsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
end
