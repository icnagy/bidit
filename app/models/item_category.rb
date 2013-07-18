class ItemCategory < ActiveRecord::Base
  has_many :items, :foreign_key => "item_category_id"
  attr_accessible :name
end
