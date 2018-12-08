class Coupon < ApplicationRecord
  validates_uniqueness_of :day
  validates_uniqueness_of :uid

  def to_param
    uid
  end
end
