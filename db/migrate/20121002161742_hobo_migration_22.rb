class HoboMigration22 < ActiveRecord::Migration
  def self.up
    drop_table :entidad_sartus

    create_table :entidads do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :entidad_proyectos, :entidad_id, :integer
    remove_column :entidad_proyectos, :entidad_sartu_id

    remove_index :entidad_proyectos, :name => :index_entidad_proyectos_on_entidad_sartu_id rescue ActiveRecord::StatementInvalid
    add_index :entidad_proyectos, [:entidad_id]
  end

  def self.down
    remove_column :entidad_proyectos, :entidad_id
    add_column :entidad_proyectos, :entidad_sartu_id, :integer

    create_table "entidad_sartus", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    drop_table :entidads

    remove_index :entidad_proyectos, :name => :index_entidad_proyectos_on_entidad_id rescue ActiveRecord::StatementInvalid
    add_index :entidad_proyectos, [:entidad_sartu_id]
  end
end
