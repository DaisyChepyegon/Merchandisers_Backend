class RoutePlanSerializer < ActiveModel::Serializer
  attributes :id, :month, :name
  belongs_to :outlet
end
