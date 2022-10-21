class Merchandiser < ApplicationRecord
  belongs_to :route_plan
  has_many :outlets
end
