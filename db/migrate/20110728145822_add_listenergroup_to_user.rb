class AddListenergroupToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :listenergroup, :integer
  end

  def self.down
    remove_column :users, :listenergroup
  end
end
