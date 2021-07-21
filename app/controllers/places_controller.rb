class PlacesController < ApplicationController
  
  def index
    places = Place.all
    render json: places.as_json
  end 
  
  def create
    place = Place.new(
      name: params[:name],
      address: params[:address]
    )

    if place.save
      render json: place.as_json
   else
     render json: {errors: place.errors.full_messages },
     status: 422
   end   

  end 
  
  
  def show
    place_id = params["id"]
    place = Place.find(place_id)
    render json: place

  end   

  def update
    place = Place.find_by(id: params[:id])
    place.name = params[:name] || place.name
    place.address = params[:address] || place.address
    
    if place.save
      render json: place.as_json
    else
      render json: {errors: place.errors.full_messages },
      status: 422
    end
  end

  def destroy
    place = Place.find_by(id: params[:id])
    place.destroy
    render json: {message: "Place is destroyed"}
  end 

end
