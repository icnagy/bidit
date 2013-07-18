class CreateItemAuctions < ActiveRecord::Migration
  def change
    create_table :item_auctions do |t|

      t.integer :item_id
      t.string :status
      t.datetime :starttime
      t.datetime :endtime
      t.decimal :starting_bid
      t.decimal :bid_step
      t.integer :lastbid_id, :null => true

      t.timestamps
    end
  end
end
