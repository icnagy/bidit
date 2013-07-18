class ItemAuctionsController < ApplicationController
  # GET /item_auctions
  # GET /item_auctions.json
  def index
    @item_auctions = ItemAuction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_auctions }
    end
  end

  # GET /item_auctions/1
  # GET /item_auctions/1.json
  def show
    @item_auction = ItemAuction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_auction }
    end
  end

  # GET /item_auctions/new
  # GET /item_auctions/new.json
  def new
    @item_auction = ItemAuction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_auction }
    end
  end

  # GET /item_auctions/1/edit
  def edit
    @item_auction = ItemAuction.find(params[:id])
  end

  # POST /item_auctions
  # POST /item_auctions.json
  def create
    @item_auction = ItemAuction.new(params[:item_auction])

    respond_to do |format|
      if @item_auction.save
        format.html { redirect_to @item_auction, notice: 'Item auction was successfully created.' }
        format.json { render json: @item_auction, status: :created, location: @item_auction }
      else
        format.html { render action: "new" }
        format.json { render json: @item_auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_auctions/1
  # PUT /item_auctions/1.json
  def update
    @item_auction = ItemAuction.find(params[:id])

    respond_to do |format|
      if @item_auction.update_attributes(params[:item_auction])
        format.html { redirect_to @item_auction, notice: 'Item auction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_auctions/1
  # DELETE /item_auctions/1.json
  def destroy
    @item_auction = ItemAuction.find(params[:id])
    @item_auction.destroy

    respond_to do |format|
      format.html { redirect_to item_auctions_url }
      format.json { head :no_content }
    end
  end
end
