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

  test "answer lists" do
    as = @default.answers_from(participants(:p_one))
    assert as.include?(answers(:a_one))
    assert as.include?(answers(:a_two))
    assert !as.include?(answers(:a_two_a))

  end

  test "completed listening test identified" do
    p = participants(:p_two)
    l = p.listeningtest
    assert l.completed_by?(p) == true
  end
end
