class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :password_digest, type: String
  field :name, type: String
  field :username, type: String
  field :email, type: String
  has_many :mapevents

  validates :name, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
  validates :password, length: {minimum: 6}
  validates :password_confirmation, presence: true
  validates_confirmation_of :password

  has_secure_password
end
