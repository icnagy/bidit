#t.integer :item_auction_id
#t.integer :user_id
#t.decimal :bid
#t.datetime :bidtime

class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :item_auction
  has_one :item, :through => :item_auction, :foreign_key => :item_id
  attr_accessible :bid, :bidtime, :item_id, :user_id, :item_auction_id

  def user_name
    self.user.name
  end

  def item_name
    self.item.name
  end
end
