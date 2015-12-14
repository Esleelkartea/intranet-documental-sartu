class HoboMigration18 < ActiveRecord::Migration
  def self.up
    create_table :facturas do |t|
      t.string   :name
      t.date     :fecha_factura
      t.decimal  :cantidad_factura, :precision => 8, :scale => 2, :default => 0
      t.text     :observaciones
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :proyecto_id
      t.integer  :cliente_id
    end
    add_index :facturas, [:proyecto_id]
    add_index :facturas, [:cliente_id]

    add_column :pedidos, :cliente_id, :integer

    add_column :cobros, :cliente_id, :integer

    add_index :pedidos, [:cliente_id]

    add_index :cobros, [:cliente_id]
  end

  def self.down
    remove_column :pedidos, :cliente_id

    remove_column :cobros, :cliente_id

    drop_table :facturas

    remove_index :pedidos, :name => :index_pedidos_on_cliente_id rescue ActiveRecord::StatementInvalid

    remove_index :cobros, :name => :index_cobros_on_cliente_id rescue ActiveRecord::StatementInvalid
  end
end
