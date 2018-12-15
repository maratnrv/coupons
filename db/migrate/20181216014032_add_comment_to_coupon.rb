class AddCommentToCoupon < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :comment, :text
  end
end
