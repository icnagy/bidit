class Bid < ActiveRecord::Base
  belongs_to :user
  attr_accessible :bid, :bidtime, :id, :item_id, :user_id
end
