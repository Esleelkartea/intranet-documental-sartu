class HoboMigration24 < ActiveRecord::Migration
  def self.up
    add_column :proyecto_users, :user_id, :integer
    add_column :proyecto_users, :proyecto_id, :integer

    add_index :proyecto_users, [:user_id]
    add_index :proyecto_users, [:proyecto_id]
  end

  def self.down
    remove_column :proyecto_users, :user_id
    remove_column :proyecto_users, :proyecto_id

    remove_index :proyecto_users, :name => :index_proyecto_users_on_user_id rescue ActiveRecord::StatementInvalid
    remove_index :proyecto_users, :name => :index_proyecto_users_on_proyecto_id rescue ActiveRecord::StatementInvalid
  end
end
