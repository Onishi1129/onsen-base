class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :postal_code
      t.integer :prefectures_select, null: false, default: 0
      t.text :onsen_place
      t.text :onsen_name
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
