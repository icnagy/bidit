#t.integer :item_category_id
#t.integer :item_auction_id
#t.string :name, :null => false
#t.date :manufactured
#t.text :description

class Item < ActiveRecord::Base
  has_one :auction, :class_name => "ItemAuction", :foreign_key => "item_id"
  #has_one :item_auction, :foreign_key => "item_id", :inverse_of => :item
  belongs_to :item_auction, :class_name => "ItemAuction"
  belongs_to :item_category
  has_many :bids, :through => :item_auction

  attr_accessor :pic
  attr_accessible :item_category_id, :description, :manufactured, :name, :state, :picture, :pic

  before_create { |record| store_picture(record) }
  before_update { |record| store_picture(record) }

  def store_picture(record)
    #puts record.picture.is_a?(ActionDispatch::Http::UploadedFile)
    #puts record.inspect

    if record.pic.is_a?(ActionDispatch::Http::UploadedFile)
      puts "Uploading file..."
      uploaded_io = record.pic
      File.open(Rails.root.join('public', 'uploads/', "#{self.id}.png"), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      record.picture = "/uploads/#{record.id}.png"
    else
      puts "No file to upload"
      if record.picture.nil?
        puts "Setting category default"
        record.picture = ItemCategory.find(self.item_category_id).picture
      end
    end
  end
end
