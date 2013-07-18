class ItemAuction < ActiveRecord::Base
  belongs_to :item
  has_many :bids, :foreign_key => "item_auction_id"

  attr_accessible :bid_step, :endtime, :item_id, :lastbid_id, :starting_bid, :starttime, :status

  def last_bid
    Bid.where(:id => :lastbid_id).first
  end

end
