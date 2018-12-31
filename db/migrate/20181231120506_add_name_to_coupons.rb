class AddNameToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :name, :text
  end
end
