class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :ofertas do |t|
      t.date     :fecha_oferta
      t.decimal  :cantidad_oferta
      t.text     :observaciones
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :ofertas
  end
end
