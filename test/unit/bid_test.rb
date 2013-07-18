require 'test_helper'

class BidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "bid must be positive" do
    assert Bid.new({:bid => -1.0}).valid?.eql?(false)
  end
end
