require 'test_helper'

class ItemAuctionsControllerTest < ActionController::TestCase
  setup do
    @item_auction = item_auctions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_auctions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_auction" do
    assert_difference('ItemAuction.count') do
      post :create, item_auction: {bid_step: @item_auction.bid_step, endtime: @item_auction.endtime, item_id: @item_auction.item_id, lastbid_id: @item_auction.lastbid_id, starting_bid: @item_auction.starting_bid, starttime: @item_auction.starttime, status: @item_auction.status}
    end

    assert_redirected_to item_auction_path(assigns(:item_auction))
  end

  test "should show item_auction" do
    get :show, id: @item_auction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_auction
    assert_response :success
  end

  test "should update item_auction" do
    put :update, id: @item_auction, item_auction: {bid_step: @item_auction.bid_step, endtime: @item_auction.endtime, item_id: @item_auction.item_id, lastbid_id: @item_auction.lastbid_id, starting_bid: @item_auction.starting_bid, starttime: @item_auction.starttime, status: @item_auction.status}
    assert_redirected_to item_auction_path(assigns(:item_auction))
  end

  test "should destroy item_auction" do
    assert_difference('ItemAuction.count', -1) do
      delete :destroy, id: @item_auction
    end

    assert_redirected_to item_auctions_path
  end
end
