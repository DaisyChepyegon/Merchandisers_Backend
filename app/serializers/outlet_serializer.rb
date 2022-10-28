class OutletSerializer < ActiveModel::Serializer
  attributes :id, :name, :location

  has_many :route_plans
end
