class HoboMigration14 < ActiveRecord::Migration
  def self.up
    drop_table :denegacions
    drop_table :impagos

    add_column :cobros, :es_impago?, :boolean, :default => false
  end

  def self.down
    remove_column :cobros, :es_impago?

    create_table "denegacions", :force => true do |t|
      t.string   "name"
      t.date     "fecha_denegacion"
      t.decimal  "cantidad_denegada", :precision => 8, :scale => 2, :default => 0.0
      t.text     "observaciones"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "proyecto_id"
    end

    add_index "denegacions", ["proyecto_id"], :name => "index_denegacions_on_proyecto_id"

    create_table "impagos", :force => true do |t|
      t.string   "name"
      t.date     "fecha_impago"
      t.decimal  "cantidad_impagada", :precision => 8, :scale => 2, :default => 0.0
      t.text     "observaciones"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
