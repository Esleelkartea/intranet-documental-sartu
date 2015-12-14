class HoboMigration26 < ActiveRecord::Migration
  def self.up
    add_column :proyectos, :num_h_destinatarios, :integer
    add_column :proyectos, :num_m_destinatarias, :integer
    add_column :proyectos, :observacoines, :text
  end

  def self.down
    remove_column :proyectos, :num_h_destinatarios
    remove_column :proyectos, :num_m_destinatarias
    remove_column :proyectos, :observacoines
  end
end
