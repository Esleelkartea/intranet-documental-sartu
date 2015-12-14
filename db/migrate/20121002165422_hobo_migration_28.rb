class HoboMigration28 < ActiveRecord::Migration
  def self.up
    add_column :proyectos, :observaciones, :text
    remove_column :proyectos, :observacoines
  end

  def self.down
    remove_column :proyectos, :observaciones
    add_column :proyectos, :observacoines, :text
  end
end
