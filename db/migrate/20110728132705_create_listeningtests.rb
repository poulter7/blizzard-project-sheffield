class CreateListeningtests < ActiveRecord::Migration
  def self.up
    create_table :listeningtests do |t|
      t.timestamps
      # keep some record of who is banned from participating
    end
  end

  def self.down
    drop_table :listeningtests
  end
end
