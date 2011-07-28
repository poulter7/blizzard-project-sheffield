class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |s|
      s.references :listeningtest
      s.text :static_links
      s.text :pool_links
      s.text :subjects
      s.string :question_template
      s.integer :index
      s.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
