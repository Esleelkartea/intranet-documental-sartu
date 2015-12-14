class HoboMigration3 < ActiveRecord::Migration
  def self.up
    drop_table :ofertas
  end

  def self.down
    create_table "ofertas", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
