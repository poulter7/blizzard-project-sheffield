class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.references :participant
      t.references :section
      t.integer    :listenergroup
      t.string     :answer_list
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
