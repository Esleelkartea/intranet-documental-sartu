class HoboMigration5 < ActiveRecord::Migration
  def self.up
    create_table :pedidos do |t|
      t.date     :fecha_pedido
      t.decimal  :cantidad_pedido
      t.text     :observaciones
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :pedidos
  end
end
