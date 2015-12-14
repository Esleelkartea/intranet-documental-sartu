class Actividad < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string, :required, :unique, :name => true
    timestamps
  end

  has_many :partes

  has_many :proyectos, :through => :actividad_proyectos
  has_many :actividad_proyectos

  #children :instrumentos

  def huactividad (instr, activ)
    Parte.sum(:horas,
              :conditions=>['proyecto_id = ? and actividad_id = ?',
                            instr.id, activ])
  end


  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
