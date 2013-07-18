class Item < ActiveRecord::Base
  has_one :item_auction, :foreign_key => "item_id"
  belongs_to :item_category
  has_many :bids, :through => :item_auction

  attr_accessible :item_category_id, :description, :manufactured, :name
end
