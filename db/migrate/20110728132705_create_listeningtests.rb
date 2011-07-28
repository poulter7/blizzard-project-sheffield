class CreateListeningtests < ActiveRecord::Migration
  def self.up
    create_table :listeningtests do |t|
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :listeningtests
  end
end
