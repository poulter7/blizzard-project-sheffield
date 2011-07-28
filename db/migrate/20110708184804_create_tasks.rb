class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.references :section
      t.references :question
      t.references :subject
      t.text :elements
      t.integer :index
      t.string :answer
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
