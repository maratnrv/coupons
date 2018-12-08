class Coupon < ApplicationRecord
  validates_uniqueness_of :day
end
