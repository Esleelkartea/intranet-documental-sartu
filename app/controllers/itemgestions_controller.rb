# -*- coding: utf-8 -*-
class ItemgestionsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
    hobo_index Itemgestion.apply_scopes(:search => [params[:search],:name, :etiquetas],
                                        :joins => :cliente, :order_by => parse_sort_param(:name, :cliente, :tipo, :fecha, :cantidad, :pendiente))
  end

  def new
    hobo_new do
      this.attributes = params[:itemgestion] || {}
      hobo_ajax_response if request.xhr?
    end
  end
  
  def edit
    hobo_show do
      this.attributes = params[:itemgestion] || {}
      hobo_ajax_response if request.xhr?
    end
  end

  def export_excel    
    @tmp = Itemgestion.apply_scopes(:search => [params[:search],:name])
    @itemgestions = @tmp.to_xls :name => "Items Gestión",
    :columns => [:tipo, :name, :fecha, :cantidad, :pendiente,
                 {:proyecto => [:name]},
                 {:cliente => [:name]}],
    :headers => ['Tipo', 'Nombre', 'Fecha','Cantidad', 'Pendiente',
                 'Proyecto', 'Cliente'],
    #:cell_format => {:color => :black},
    :header_format => {:weight => :bold, :color => :blue}
    
    send_data @itemgestions, :filename => 'itemsgestion.xls'
  end

end
