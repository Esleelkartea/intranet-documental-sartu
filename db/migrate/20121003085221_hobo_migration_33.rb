class HoboMigration33 < ActiveRecord::Migration
  def self.up
    add_column :itemgestions, :etiquetas, :string
  end

  def self.down
    remove_column :itemgestions, :etiquetas
  end
end
