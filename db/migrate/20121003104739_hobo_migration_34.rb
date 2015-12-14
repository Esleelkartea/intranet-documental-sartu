class HoboMigration34 < ActiveRecord::Migration
  def self.up
    add_column :proyectos, :prioridad, :string, :default => :baja
  end

  def self.down
    remove_column :proyectos, :prioridad
  end
end
