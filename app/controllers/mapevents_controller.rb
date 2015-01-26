class MapeventsController < ApplicationController

	def index
		if params[:category].nil?
			@mapevents = Mapevent.all
		else
			@mapevents = Mapevent.where(category: params[:category])
		end
		@mapevent = Mapevent.new
	end
	
	def events
		@mapevents = Mapevent.all
	end

	def create
		@mapevent = Mapevent.new(params.require(:mapevent).permit(:title, :category, :address, :city, :state, :zip, :description))

		@mapevent.latitude = Geokit::Geocoders::GoogleGeocoder.geocode(@mapevent.full_address).latitude
		@mapevent.longitude = Geokit::Geocoders::GoogleGeocoder.geocode(@mapevent.full_address).longitude

		if @mapevent.save
			redirect_to mapevents_path
		else
			render "index"
		end
	end

	def edit
		@mapevent = Mapevent.find(params[:id])
	end

	def update
		@mapevent = Mapevent.find(params[:id])

	    if @mapevent.update(:mapevent).permit(:latitude, :longitude, :description, :title, :category, :address, :city, :state, :zip)
	      redirect_to ingredients_path
	    else
	      render :edit
	    end

	end

	def destroy
		@mapevent = Mapevent.find(params[:id])
    
    	@mapevent.destroy
    
    	redirect_to events_path
	end

end
