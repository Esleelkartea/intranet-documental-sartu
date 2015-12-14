class HoboMigration19 < ActiveRecord::Migration
  def self.up
    create_table :item_gestions do |t|
      t.string   :tipo
      t.string   :name
      t.date     :fecha
      t.decimal  :cantidad, :precision => 8, :scale => 2, :default => 0
      t.text     :observaciones
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :proyecto_id
      t.integer  :cliente_id
    end
    add_index :item_gestions, [:proyecto_id]
    add_index :item_gestions, [:cliente_id]
  end

  def self.down
    drop_table :item_gestions
  end
end
