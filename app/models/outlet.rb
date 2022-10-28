class Outlet < ApplicationRecord
  has_many :route_plans
  has_many :merchandisers, through: :route_plans

end
