class HoboMigration11 < ActiveRecord::Migration
  def self.up
    create_table :denegacions do |t|
      t.string   :name
      t.date     :fecha_denegacion
      t.decimal  :cantidad_denegada, :precision => 8, :scale => 2, :default => 0
      t.text     :observaciones
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :proyecto_id
    end
    add_index :denegacions, [:proyecto_id]
  end

  def self.down
    drop_table :denegacions
  end
end
