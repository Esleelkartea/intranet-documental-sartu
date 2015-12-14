class HoboMigration13 < ActiveRecord::Migration
  def self.up
    create_table :impagos do |t|
      t.string   :name
      t.date     :fecha_impago
      t.decimal  :cantidad_impagada, :precision => 8, :scale => 2, :default => 0
      t.text     :observaciones
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :impagos
  end
end
