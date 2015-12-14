class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :proyectos do |t|
      t.string   :name
      t.date     :fecha_inicio
      t.date     :fecha_cierre
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :clientes do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :proyectos
    drop_table :clientes
  end
end
