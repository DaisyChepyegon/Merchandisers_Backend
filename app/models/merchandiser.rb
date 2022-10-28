class Merchandiser < ApplicationRecord
  has_secure_password
  has_many :route_plans
  has_many :outlets, through: :route_plans
end
