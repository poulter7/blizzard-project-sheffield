require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  setup do
    @a_one = answers(:a_one)
  end

  test "count of answered questions" do
    
    @a_one.answer_list = ['abc',nil,nil]
    c = @a_one.answered_count
    assert c == 1, c.to_s
  end

  test "answered" do
    @a_one.answer_list = ['abc',nil,nil]
    assert  @a_one.isanswered?(0) == true
    assert  @a_one.isanswered?(1) == false
  end
end
