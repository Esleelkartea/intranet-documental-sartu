class HoboMigration27 < ActiveRecord::Migration
  def self.up
    add_column :item_gestions, :pendiente, :boolean, :default => true
  end

  def self.down
    remove_column :item_gestions, :pendiente
  end
end
