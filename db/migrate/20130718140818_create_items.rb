class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.integer :item_category_id
      t.integer :item_auction_id
      t.string :name, :null => false
      t.date :manufactured
      t.string :state
      t.string :picture
      t.text :description

      t.timestamps
    end
  end
end
