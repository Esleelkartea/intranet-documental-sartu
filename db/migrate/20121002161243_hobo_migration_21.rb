class HoboMigration21 < ActiveRecord::Migration
  def self.up
    create_table :entidad_sartus do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :entidad_proyectos do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :entidad_sartu_id
      t.integer  :proyecto_id
    end
    add_index :entidad_proyectos, [:entidad_sartu_id]
    add_index :entidad_proyectos, [:proyecto_id]
  end

  def self.down
    drop_table :entidad_sartus
    drop_table :entidad_proyectos
  end
end
