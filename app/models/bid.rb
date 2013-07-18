class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :item_auction
  has_one :item, :through => :item_auction, :foreign_key => :item_id
  attr_accessible :bid, :bidtime, :item_id, :user_id, :item_auction_id

  validates_presence_of :bid, :bidtime, :item_id, :user_id
  validates_numericality_of :bid
  validates_uniqueness_of :bidtime
end
