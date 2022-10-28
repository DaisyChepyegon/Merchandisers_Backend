class MerchandiserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image, :phone_number, :password_digest, :location

  has_many :route_plans

end
