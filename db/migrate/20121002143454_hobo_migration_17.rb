class HoboMigration17 < ActiveRecord::Migration
  def self.up
    add_column :ofertas, :cliente_id, :integer

    add_index :ofertas, [:cliente_id]
  end

  def self.down
    remove_column :ofertas, :cliente_id

    remove_index :ofertas, :name => :index_ofertas_on_cliente_id rescue ActiveRecord::StatementInvalid
  end
end
