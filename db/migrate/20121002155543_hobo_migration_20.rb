class HoboMigration20 < ActiveRecord::Migration
  def self.up
    drop_table :pedidos
    drop_table :ofertas
    drop_table :cobros
    drop_table :facturas
  end

  def self.down
    create_table "pedidos", :force => true do |t|
      t.date     "fecha_pedido"
      t.decimal  "cantidad_pedido", :default => 0.0
      t.text     "observaciones"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "proyecto_id"
      t.string   "name"
      t.boolean  "es_denegado",     :default => false
      t.integer  "cliente_id"
    end

    add_index "pedidos", ["cliente_id"], :name => "index_pedidos_on_cliente_id"
    add_index "pedidos", ["proyecto_id"], :name => "index_pedidos_on_proyecto_id"

    create_table "ofertas", :force => true do |t|
      t.date     "fecha_oferta"
      t.decimal  "cantidad_oferta", :default => 0.0
      t.text     "observaciones"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "proyecto_id"
      t.string   "name"
      t.integer  "cliente_id"
    end

    add_index "ofertas", ["cliente_id"], :name => "index_ofertas_on_cliente_id"
    add_index "ofertas", ["proyecto_id"], :name => "index_ofertas_on_proyecto_id"

    create_table "cobros", :force => true do |t|
      t.string   "name"
      t.date     "fecha_cobro"
      t.decimal  "cantidad_cobrada", :default => 0.0
      t.text     "observaciones"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "proyecto_id"
      t.boolean  "es_impago",        :default => false
      t.integer  "cliente_id"
    end

    add_index "cobros", ["cliente_id"], :name => "index_cobros_on_cliente_id"
    add_index "cobros", ["proyecto_id"], :name => "index_cobros_on_proyecto_id"

    create_table "facturas", :force => true do |t|
      t.string   "name"
      t.date     "fecha_factura"
      t.decimal  "cantidad_factura", :precision => 8, :scale => 2, :default => 0.0
      t.text     "observaciones"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "proyecto_id"
      t.integer  "cliente_id"
    end

    add_index "facturas", ["cliente_id"], :name => "index_facturas_on_cliente_id"
    add_index "facturas", ["proyecto_id"], :name => "index_facturas_on_proyecto_id"
  end
end
