class User < ActiveRecord::Base
  has_many :bids, :foreign_key => "user_id"
  attr_accessible :email, :name, :password

  validates_presence_of :email, :name, :password
  validates_uniqueness_of :email, :scope => :password
end
