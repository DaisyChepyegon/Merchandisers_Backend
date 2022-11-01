class ManagerSerializer < ActiveModel::Serializer
  attributes :id,  :email,  :password, :username, :location, :image, :contact
end
