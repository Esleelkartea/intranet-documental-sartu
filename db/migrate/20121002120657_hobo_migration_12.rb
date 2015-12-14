class HoboMigration12 < ActiveRecord::Migration
  def self.up
    create_table :cobros do |t|
      t.string   :name
      t.date     :fecha_cobro
      t.decimal  :cantidad_cobrada, :precision => 8, :scale => 2, :default => 0
      t.text     :observaciones
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :proyecto_id
    end
    add_index :cobros, [:proyecto_id]
  end

  def self.down
    drop_table :cobros
  end
end
