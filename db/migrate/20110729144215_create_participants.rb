class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.references :user
      t.references :listeningtest
      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
