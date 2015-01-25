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
		@mapevents = Mapevents.all
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
		authorize! :create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
