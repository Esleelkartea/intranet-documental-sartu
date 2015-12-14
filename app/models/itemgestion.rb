class Itemgestion < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    tipo      enum_string(:oferta,:oferta_perdida,:pedido,:pedido_denegado,:factura,:factura_devuelta,:cobro,:impago)
    name      :string, :required
    etiquetas :string
    fecha     :date, :required
    cantidad  :decimal, :required, :precision => 8, :scale => 2
    pendiente :boolean, :default => true
    observaciones :text
    timestamps
  end

  belongs_to :proyecto
  belongs_to :cliente

  validates_numericality_of :cantidad
  validates_presence_of :proyecto, :cliente

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
