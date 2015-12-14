class HoboMigration32 < ActiveRecord::Migration
  def self.up
    create_table :actividades do |t|
      t.string   :nombre
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :actividad_proyectos do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :actividad_id
      t.integer  :proyecto_id
    end
    add_index :actividad_proyectos, [:actividad_id]
    add_index :actividad_proyectos, [:proyecto_id]

    create_table :partes do |t|
      t.string   :anho
      t.string   :semana
      t.integer  :horas
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :proyecto_id
      t.integer  :actividad_id
      t.integer  :user_id
    end
    add_index :partes, [:proyecto_id]
    add_index :partes, [:actividad_id]
    add_index :partes, [:user_id]
  end

  def self.down
    drop_table :actividades
    drop_table :actividad_proyectos
    drop_table :partes
  end
end
