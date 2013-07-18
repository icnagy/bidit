class User < ActiveRecord::Base
  has_many :bids, :foreign_key => "user_id"
  attr_accessible :email, :name, :password
end
