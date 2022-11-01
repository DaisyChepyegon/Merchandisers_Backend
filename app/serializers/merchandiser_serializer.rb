class MerchandiserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image, :contact, :password_digest, :location

end
