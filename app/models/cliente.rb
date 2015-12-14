class Cliente < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end

  has_many :proyectos, :through => :cliente_proyectos
  has_many :cliente_proyectos

  has_many :itemgestions

  children :proyectos

  has_many :users, :through => :proyecto_users
  has_many :proyecto_users

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
