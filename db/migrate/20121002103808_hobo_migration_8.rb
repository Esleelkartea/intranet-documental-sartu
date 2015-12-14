class HoboMigration8 < ActiveRecord::Migration
  def self.up
    change_column :pedidos, :cantidad_pedido, :decimal, :precision => 8, :scale => 2, :default => 0

    change_column :ofertas, :cantidad_oferta, :decimal, :precision => 8, :scale => 2, :default => 0
  end

  def self.down
    change_column :pedidos, :cantidad_pedido, :decimal

    change_column :ofertas, :cantidad_oferta, :decimal
  end
end
