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

  validates :title, :category, :address, :description, presence: true

  def full_address
  	return "#{address}, #{city}, #{state}, #{zip}"
  end
end