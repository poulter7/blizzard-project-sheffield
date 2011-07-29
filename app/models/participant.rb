class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :section

  before_create do
    # place the participant into a listening group
    #  everything but NIL and false in Ruby is false
    unless self.listenergroup
      self.listenergroup = 1
    end
  end

end
