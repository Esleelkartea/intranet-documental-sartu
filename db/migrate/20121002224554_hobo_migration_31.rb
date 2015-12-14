class HoboMigration31 < ActiveRecord::Migration
  def self.up
    add_column :proyectos, :etiquetas, :string
    remove_column :proyectos, :etiqueta
  end

  def self.down
    remove_column :proyectos, :etiquetas
    add_column :proyectos, :etiqueta, :string
  end
end
