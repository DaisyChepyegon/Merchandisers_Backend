class MerchandiserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image, :phone_number, :password_digest, :location, :longitude, :latitude

end
