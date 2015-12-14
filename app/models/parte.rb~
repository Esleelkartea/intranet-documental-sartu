# -*- coding: utf-8 -*-
include SartuHelper

class Parte < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    anho enum_string(2012,2013,2014,2015,2016), :required
    semana :string, :required
    horas :integer, :required
    timestamps
  end

  belongs_to :proyecto
  belongs_to :actividad
  belongs_to :user, :creator => true

  validates_presence_of :proyecto, :actividad

  #after_validation :frogatzen
  #def frogatzen
  #  logger.info "froga "+errors.to_s
  #end

  def self.last_new (u)
  #se define como de clase para facilitar llamada desde controlador
    p=Parte.new
    r=Parte.all(:conditions => {:user_id => u}).last
    if r.nil?
      p.anho= Date.today.year.to_s
      p.semana=semanasanho(Date.today.year)[Date.today.cweek - 1] #esta semana
    else
      p.anho=r.anho
      p.semana=r.semana
      p.actividad = r.actividad
      p.proyecto = r.proyecto
    end
    p.user = u
    return p
  end


  # --- Permissions --- #

  def create_permitted?
    #acting_user.signed_up? && user == acting_user
    acting_user.administrator? || acting_user == user
  end

  def update_permitted?
    #acting_user.administrator? || (acting_user.signed_up? && !user_changed?)
    (acting_user.signed_up? && !user_changed?)
  end

  def destroy_permitted?
    acting_user.administrator? || acting_user == user
  end

  def view_permitted?(field)
    acting_user.administrator? || acting_user == user
  end

end
