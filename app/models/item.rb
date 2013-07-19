#t.integer :item_category_id
#t.integer :item_auction_id
#t.string :name, :null => false
#t.date :manufactured
#t.text :description

class Item < ActiveRecord::Base
  has_one :item_auction, :foreign_key => "item_id"
  belongs_to :item_category
  has_many :bids, :through => :item_auction

  attr_accessible :item_category_id, :description, :manufactured, :name, :state

end
