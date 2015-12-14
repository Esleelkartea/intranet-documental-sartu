class HoboMigration23 < ActiveRecord::Migration
  def self.up
    create_table :proyecto_users do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :proyecto_users
  end
end
