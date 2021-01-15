require "test_helper"

class RusherTest < ActiveSupport::TestCase

  def setup
    @rusher = Rusher.new({
      names: "James Smith",
      team: "sf",
      pos: "RB",
    })
  end

  test "multiple name parsing" do
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

  test "name search" do
    @rusher.names = "Bill Last"
    @rusher.save

    ["Bill", "BILL", "bill"].each do |n|
      assert Rusher.names(n).count, 1
    end

    assert Rusher.names("Not Present").count, 0
  end


end
