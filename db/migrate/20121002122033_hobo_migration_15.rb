class HoboMigration15 < ActiveRecord::Migration
  def self.up
    add_column :cobros, :es_impago, :boolean, :default => false
    remove_column :cobros, :es_impago?
  end

  def self.down
    remove_column :cobros, :es_impago
    add_column :cobros, :es_impago?, 
  end
end
