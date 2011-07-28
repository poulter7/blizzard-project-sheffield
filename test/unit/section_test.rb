require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  setup do
    @section = sections(:default)
    @user = users(:userone)
  end

  test "the correct size latin square is assumed" do
    assert @section.latinSqSize == 9
  end

  test "user recieves a correct playlist from the Latin Square" do
      
  end
end


