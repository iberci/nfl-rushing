require "test_helper"

class RusherTest < ActiveSupport::TestCase

  def setup
    @rusher = Rusher.new({
      names: "James Smith",
      team: "sf",
      pos: "RB",
    })
  end

  test "multiple names" do
    assert @rusher.valid? 

    [
      "Bill, Ted",
      "Bill    Ted",
      ["Bill    Ted"],
      ["Bill", [nil, "Ted"]]
    ].each do |n|
      @rusher.names = n
      assert @rusher.rusher_names.size, 2
    end
  end


end
