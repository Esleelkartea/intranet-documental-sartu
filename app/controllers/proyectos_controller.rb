# -*- coding: utf-8 -*-
class ProyectosController < ApplicationController

  hobo_model_controller

  auto_actions :all

#  index_action :info

  def index
    @tmp = Proyecto.apply_scopes(:search => [params[:search],:name,:etiquetas],
                                 :order_by => parse_sort_param(:name, :prioridad))

    @ofertado     = Itemgestion.sum(:cantidad, :conditions => ['tipo="oferta" and proyecto_id in (?)', @tmp.map(&:id)])
    @perdido      = Itemgestion.sum(:cantidad, :conditions => ['tipo="oferta_perdida" and proyecto_id in (?)', @tmp.map(&:id)])
    @oferta_dif   = @ofertado - @perdido

    @pedido       = Itemgestion.sum(:cantidad, :conditions => ['tipo="pedido" and proyecto_id in (?)', @tmp.map(&:id)]) 
    @denegado     = Itemgestion.sum(:cantidad, :conditions => ['tipo="pedido_denegado" and proyecto_id in (?)', @tmp.map(&:id)])
    @pedido_neto  = @pedido - @denegado
    @pedido_pdte  = @oferta_dif - @pedido

    @facturado    = Itemgestion.sum(:cantidad, :conditions => ['tipo="factura" and proyecto_id in (?)', @tmp.map(&:id)])
    @devuelto     = Itemgestion.sum(:cantidad, :conditions => ['tipo="factura_devuelta" and proyecto_id in (?)', @tmp.map(&:id)])
    @factura_neto = @facturado - @devuelto
    @factura_pdte = @pedido_neto - @factura_neto

    @cobrado      = Itemgestion.sum(:cantidad, :conditions => ['tipo="cobro" and proyecto_id in (?)', @tmp.map(&:id)])
    @impagado     = Itemgestion.sum(:cantidad, :conditions => ['tipo="impago" and proyecto_id in (?)', @tmp.map(&:id)])
    @cobro_neto   = @cobrado - @impagado
    @cobro_pdte   = @factura_neto - @cobrado - @impagado

    hobo_index @tmp
  end

  def info
#    @search = Proyecto.all
#    @proyectos = @search.paginate(:page => params[:page])
#    hobo_index Proyecto.all
#    hobo_index Proyecto.apply_scopes(:search => [params[:search],:name],
#                                     :order_by => parse_sort_param(:name, :zona))
    #@proyectos = Proyecto.all
    #hobo_index @proyectos
    hobo_index
  end

  def export_excel    
    @tmp = Proyecto.apply_scopes(:search => [params[:search],:name,:etiquetas])
    @proyectos = @tmp.to_xls :name => "Proyectos",
    :columns => [:name, :fecha_inicio, :fecha_cierre, {:zona => [:name]},
                 :clientes_str, :users_str, :entidades_str,
                 :ofertado, :perdido, :oferta_dif,
                 :pedido, :denegado, :pedido_neto, :pedido_pdte,
                 :facturado, :devuelto, :factura_neto, :factura_pdte,
                 :cobrado, :impagado, :cobro_neto, :cobro_pdte],
    :headers => ['Nombre', 'Fecha inicio','Fecha cierre', 'Zona',
                 'Clientes', 'Usuarios', 'Entidades',
                 'Ofertas', 'Ofertas perdidas','Diferencia',
                 'Pedidos', 'Denegado', 'Pedido neto', 'Pedido pdte.',
                 'Facturas', 'Devuelto', 'Fact. Neto', 'Facturación pdte.',
                 'Cobros', 'Impagos', 'Cobro neto', 'Cobro pdte.'],
    #:cell_format => {:color => :black},
    :header_format => {:weight => :bold, :color => :blue}
    
    send_data @proyectos, :filename => 'proyectos.xls'
  end
end
