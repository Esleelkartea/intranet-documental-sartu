class HoboMigration16 < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :es_denegado, :boolean, :default => false
  end

  def self.down
    remove_column :pedidos, :es_denegado
  end
end
