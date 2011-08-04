require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  setup do
    @section = sections(:default)
    @participant = participants(:one)
    @participant_two= participants(:two)
  end

  test "correct question index is given" do
    @participant.answers = [1,2,3,nil,nil]
    a = @participant.currentQuestion
    # TODO figure out nil objects in fixtures
    assert a  == 3, "calculated current Q is #{a}"
    @participant.answers = [1, nil,2,3,nil,nil]
    a = @participant.currentQuestion
    # TODO figure out nil objects in fixtures
    assert a  == 1, "calculated current Q is #{a}"
  end
end
