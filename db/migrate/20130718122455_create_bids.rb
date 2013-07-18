class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :item_auction_id
      t.integer :user_id
      t.decimal :bid
      t.datetime :bidtime

      t.timestamps
    end
  end
end
