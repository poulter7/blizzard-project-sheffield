require 'test_helper'

class ListeningtestTest < ActiveSupport::TestCase
  #
  setup do
    @default = listeningtests(:default)
  end

  test "sections are correct" do
    ss = @default.sections
    assert ss.include?(sections(:s_one))
    assert ss.include?(sections(:s_two))
    assert ss.include?(sections(:s_three))
    assert !ss.include?(sections(:s_four))
  end
end
