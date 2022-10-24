class Merchandiser < ApplicationRecord
  has_secure_password
  belongs_to :route_plan
  has_many :outlets
end
