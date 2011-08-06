require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  setup do
    @section = sections(:s_one)
    @section_three = sections(:s_three)
    @answer = answers(:a_one)
    @answer_two = answers(:a_one_a)
  end


  test "correct numbers of participants is calculated" do
    participants = @section.getListenergroupParticipants
    assert participants == [1,0,1], "#{participants}"

    # Create a new participant
    Answer.create(:section => @section, :listenergroup => 1)
    participants = @section.getListenergroupParticipants
    assert participants == [1,1,1], "#{participants}"
  end

  test "listenergroup assignment is correct" do
    a = @section.getListenergroupAssignment
    assert a == 1, a.to_s
  end

  ############################
  #
  ############################


  ############################
  # Latin square related tests
  ############################
  test "check latin square is loaded" do
      assert @section.latinsquare == [[1,2,3],[3,1,2],[2,3,1]]
  end

  test "correct size latin square is assumed" do
    assert @section.latinSqSize == 3
  end

  test "user recieves a correct playlist from the Latin Square" do
     @expected_playlist = [ 
                  'sd100/news/001c0202.wav',
                  'sd1000/news/001c022e.wav',
                  'sd2000/news/001c0601.wav'
     ]
     playlistCheck(@expected_playlist, @answer.listenergroup)
     @expected_playlist = [
                  'sd1000/news/001c0202.wav',
                  'sd2000/news/001c022e.wav',
                  'sd100/news/001c0601.wav'
     ]
     playlistCheck(@expected_playlist, @answer_two.listenergroup)
  end

  def playlistCheck(expected_playlist, listenergroup)
    playlist = @section.getPlaylist(listenergroup)
    assert playlist == expected_playlist, "Playlist should be: #{expected_playlist}\nGot: #{playlist}"

  end

  test "correct system is given" do
    a = @section.getSystem(@answer.listenergroup, 1)
    assert a == 'sd1000', a
  end

  test "if not enough files in pool still give a file" do
    a = @section_three.getClip(4)
    lsq = @section_three.latinSqSize
    assert lsq == 3, "latin sq size #{lsq}"
    assert a == 'news/001c0202.wav', "incorrect file given: #{a}"
  end

  test "correct file is given based on the user and their location in the section" do
    a = @section.getFile(@answer.listenergroup, 1)
    assert a == 'sd1000/news/001c022e.wav', a
  end
end


