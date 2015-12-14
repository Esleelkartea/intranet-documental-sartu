class HoboMigration7 < ActiveRecord::Migration
  def self.up
    add_column :cliente_proyectos, :cliente_id, :integer
    add_column :cliente_proyectos, :proyecto_id, :integer

    add_index :cliente_proyectos, [:cliente_id]
    add_index :cliente_proyectos, [:proyecto_id]
  end

  def self.down
    remove_column :cliente_proyectos, :cliente_id
    remove_column :cliente_proyectos, :proyecto_id

    remove_index :cliente_proyectos, :name => :index_cliente_proyectos_on_cliente_id rescue ActiveRecord::StatementInvalid
    remove_index :cliente_proyectos, :name => :index_cliente_proyectos_on_proyecto_id rescue ActiveRecord::StatementInvalid
  end
end
