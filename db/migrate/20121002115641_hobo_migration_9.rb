class HoboMigration9 < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :proyecto_id, :integer

    add_column :ofertas, :proyecto_id, :integer

    add_index :pedidos, [:proyecto_id]

    add_index :ofertas, [:proyecto_id]
  end

  def self.down
    remove_column :pedidos, :proyecto_id

    remove_column :ofertas, :proyecto_id

    remove_index :pedidos, :name => :index_pedidos_on_proyecto_id rescue ActiveRecord::StatementInvalid

    remove_index :ofertas, :name => :index_ofertas_on_proyecto_id rescue ActiveRecord::StatementInvalid
  end
end
