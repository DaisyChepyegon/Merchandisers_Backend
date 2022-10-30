class RoutePlanSerializer < ActiveModel::Serializer
  attributes :id, :route_name, :merchandiser, :outlets, :location, :time
  
end
