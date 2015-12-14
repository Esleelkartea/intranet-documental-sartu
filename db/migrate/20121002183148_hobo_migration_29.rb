class HoboMigration29 < ActiveRecord::Migration
  def self.up
    drop_table :item_gestions

    create_table :itemgestions do |t|
      t.string   :tipo
      t.string   :name
      t.date     :fecha
      t.decimal  :cantidad, :precision => 8, :scale => 2
      t.boolean  :pendiente, :default => true
      t.text     :observaciones
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :proyecto_id
      t.integer  :cliente_id
    end
    add_index :itemgestions, [:proyecto_id]
    add_index :itemgestions, [:cliente_id]
  end

  def self.down
    create_table "item_gestions", :force => true do |t|
      t.string   "tipo"
      t.string   "name"
      t.date     "fecha"
      t.decimal  "cantidad",      :precision => 8, :scale => 2, :default => 0.0
      t.text     "observaciones"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "proyecto_id"
      t.integer  "cliente_id"
      t.boolean  "pendiente",                                   :default => true
    end

    add_index "item_gestions", ["cliente_id"], :name => "index_item_gestions_on_cliente_id"
    add_index "item_gestions", ["proyecto_id"], :name => "index_item_gestions_on_proyecto_id"

    drop_table :itemgestions
  end
end
