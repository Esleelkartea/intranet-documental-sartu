class HoboMigration6 < ActiveRecord::Migration
  def self.up
    create_table :cliente_proyectos do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :cliente_proyectos
  end
end
