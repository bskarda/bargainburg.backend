class Coupon < ActiveRecord::Base
	belongs_to :merchant
	belongs_to :category
end
