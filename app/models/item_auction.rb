#t.integer :item_id
#t.string :status
#t.datetime :starttime
#t.datetime :endtime
#t.decimal :starting_bid
#t.decimal :bid_step
#t.integer :lastbid_id, :null => true

class ItemAuction < ActiveRecord::Base
  has_one :auction_item, :class_name => "Item", :foreign_key => "item_auction_id", :dependent => :nullify
  belongs_to :item, :foreign_key => "item_id", :inverse_of => :item_auction
  has_many :bids, :foreign_key => "item_auction_id"

  attr_accessible :bid_step, :endtime, :item_id, :lastbid_id, :starting_bid, :starttime, :status

  delegate :name, :to => :item, :prefix => true

  validates_presence_of :starttime, :endtime, :starting_bid, :bid_step
  validate :check_dates, :check_item

  validates_uniqueness_of :status, :scope => :item_id

  after_create :update_item

  def update_item
    self.item.item_auction = self
    self.item.save
  end

  def check_item
    if self.item_id.nil?
      self.errors.add(:item_id, "Wrong item")
    end
  end

  def check_dates
    puts self.starttime - Time.now >= 5.minutes
    puts (self.endtime - self.starttime >= 5.minutes)
    if (self.starttime - Time.now <= 5.minutes) && (self.endtime - self.starttime < 5.minutes)
      self.errors.add(:starttime, "Wrong time")
      self.errors.add(:endtime, "Wrong time")
    end
  end

  def last_bid
    @last_bid = Bid.where(:id => self.lastbid_id).order('created_at DESC').first
  end

  def last_bid_amount
    if self.last_bid
      self.last_bid.bid
    else
      BigDecimal.new("0.00")
    end
  end

  def close
    self.status = "Closed"
    self.save
  end

  def open
    self.status = "Ongoing"
    self.save
  end

  def place_bid(params, user_id)
    if self.status == "Ongoing" && self.last_bid_amount.eql?(BigDecimal.new params[:current_bid])
      @last_bid = self.bids.create(:user_id => user_id, :bid => self.last_bid_amount + self.bid_step, :bidtime => Time.now)
      self.lastbid_id = @last_bid.id
      if self.endtime < 5.minutes.from_now
        self.endtime += 5.minutes
      end
      self.save
    else
      false
    end
  end

  def do_i_have_the_winning_bid?(user_id)
    if self.last_bid.nil?
      false
    else
      self.last_bid.user_id == user_id
    end
  end

  def ongoing?
    now = Time.now
    if now > self.starttime && now < self.endtime
      self.status = "Ongoing"
      self.save
      true
    else
      if now >self.endtime
        self.status = "Ended"
        self.save
      end
      false
    end
  end
end
