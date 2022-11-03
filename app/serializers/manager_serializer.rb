class ManagerSerializer < ActiveModel::Serializer
  attributes :id,  :email,  :password, :username, :location, :image, :phone_number
end
