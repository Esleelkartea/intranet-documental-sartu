class HoboMigration10 < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :name, :string

    add_column :ofertas, :name, :string
  end

  def self.down
    remove_column :pedidos, :name

    remove_column :ofertas, :name
  end
end
