require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  setup do
    @section = sections(:s_one)
    @answer  = answers(:a_one)
    @participant = participants(:p_one)
  end

  test "answers" do
    a = @participant.answer_list(@section)
    assert a == ['abc','abc','bcd'], a.to_s
  end

  test "correct question index is given" do
    @answer.update_attributes(:answer_list => [1,nil,nil])
    a = @participant.currentQuestion(@section)
    # TODO figure out nil objects in fixtures
    assert a  == 1, "calculated current Q is #{a}"

    @answer.update_attributes(:answer_list => [1,2,3])
    a = @participant.currentQuestion(@section)
#    # TODO figure out nil objects in fixtures
    assert a.nil?, "calculated current Q is #{a}"
  end
end
