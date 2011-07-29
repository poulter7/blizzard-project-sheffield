require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  setup do
    @section = sections(:default)
    @participant = participants(:one)
    @participant_two= participants(:two)
  end

  test "demo participant is the correct group" do
    assert @participant.listenergroup == 0
  end

  test "correct numbers of participants is calculated" do
    participants = @section.getListenergroupParticipants
    assert participants == [1,0,1], "#{participants}"

    # Create a new participant
    Participant.create(:section => @section, :listenergroup => 2)
    participants = @section.getListenergroupParticipants
    assert participants == [1,0,2], "#{participants}"
  end

  


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
     playlistCheck(@expected_playlist, @participant)
     @expected_playlist = [
                  'sd1000/news/001c0202.wav',
                  'sd2000/news/001c022e.wav',
                  'sd100/news/001c0601.wav'
     ]
     playlistCheck(@expected_playlist, @participant_two)
  end

  def playlistCheck(expected_playlist, participant)
    playlist = @section.getPlaylist(participant)
    assert playlist == expected_playlist, "Playlist should be: #{expected_playlist}\nGot: #{playlist}"

  end

  test "correct file is given based on the user and their location in the section" do
    assert @section.getFile(@participant, 1) == 'sd1000/news/001c022e.wav'
  end
end


