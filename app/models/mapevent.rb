class Mapevent
  include Mongoid::Document
  field :latitude, type: Float
  field :longitude, type: Float
  field :description, type: String
  field :title, type: String
  field :category, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  belongs_to :user

  validates :title, :category, :address, :description, presence: true

  def self.full_address
  	return "#{address}, #{city}, #{state}, #{zip}"
  end

  def self.eventbrite

    event ||= "restaurants"
    latitude ||= 34
    longitude ||= -118
    within ||= '10mi'
    category ||= 110

    auth = { query: { token: ENV['eventbrite_key'], q: event, categories: category, 'location.longitude': longitude,  'location.latitude': latitude,  'location.within': within }}
    search_url = "https://www.eventbriteapi.com/v3/events/search"

    response = HTTParty.get search_url, auth
    # parsed_json = JSON.parse response

    return response

  end    

end