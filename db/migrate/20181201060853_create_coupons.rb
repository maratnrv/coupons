class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.timestamp :day, null: false
      t.text :content
      t.text :code_url
      t.text :uid, null: false
      t.boolean :used
    end
  end
end
