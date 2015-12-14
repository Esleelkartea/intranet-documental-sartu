class HoboMigration30 < ActiveRecord::Migration
  def self.up
    add_column :proyectos, :etiqueta, :string
  end

  def self.down
    remove_column :proyectos, :etiqueta
  end
end
