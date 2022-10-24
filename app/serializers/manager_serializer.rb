class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password, :password_confirmation
end
