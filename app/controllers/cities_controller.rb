class CitiesController < ApplicationController
  def show
  	@city = City.friendly.find(params[:name])
    render :show
  end
end
