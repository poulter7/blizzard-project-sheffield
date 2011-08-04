class AddAnswersToParticipant < ActiveRecord::Migration
  def self.up
    add_column :participants, :answers, :string
  end

  def self.down
    remove_column :participants, :answers
  end
end
