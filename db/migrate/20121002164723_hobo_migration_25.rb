class HoboMigration25 < ActiveRecord::Migration
  def self.up
    create_table :zonas do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :proyectos, :zona_id, :integer

    add_index :proyectos, [:zona_id]
  end

  def self.down
    remove_column :proyectos, :zona_id

    drop_table :zonas

    remove_index :proyectos, :name => :index_proyectos_on_zona_id rescue ActiveRecord::StatementInvalid
  end
end
