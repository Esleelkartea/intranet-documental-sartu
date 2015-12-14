# -*- coding: utf-8 -*-
class PartesController < ApplicationController
#  require 'spreadsheet'

  hobo_model_controller

  auto_actions :all, :except => [:index, :show]


  def new
    @tmp=Parte.order("semana DESC").apply_scopes :search => [params[:search],"semana"], :joins=>:proyecto,
    :order_by => parse_sort_param(:semana, :proyecto, :actividad)

    if !params[:parte].nil? #Viene de ajax
      hobo_new do
        this.attributes = params[:parte] || {}
        hobo_ajax_response if request.xhr?
      end
    else #No viene de ajax
      hobo_new Parte.last_new(current_user)
    end
  end

  def edit
    @tmp=Parte.apply_scopes :search => [params[:search],"semana"], :joins=>:proyecto,:order_by => parse_sort_param(:semana, :proyecto, :actividad)

    hobo_show do
      this.attributes = params[:parte] || {}
      hobo_ajax_response if request.xhr?
    end
  end



  def create
    #consulta necesaria para el caso en que haya errores, ej. si no indica ningún nº de horas
    @tmp=Parte.order("semana DESC").apply_scopes :search => [params[:search],"semana"], :joins=>:proyecto,
    :order_by => parse_sort_param(:semana, :proyecto, :actividad)
    hobo_create :redirect => "/partes/new"
  end

  def update
    hobo_update :redirect => "/partes/new"
  end


  def export_excel
    @partes = Parte.all.to_xls :name => "Partes",
    :columns => [:anho, :semana, :horas,
                 {:proyecto => [:nombre]},
                 {:actividad => [:nombre]},
                 {:user => [:name]}],
    :headers => ['Año', 'Semana','Horas', 'Proyecto', 'Actividad', 'Usuario'],
    #:cell_format => {:color => :black},
    :header_format => {:weight => :bold, :color => :blue}

    send_data @partes, :filename => 'partes.xls'
  end

  def export_excel_bis
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="excel-export.xls"'
    headers['Cache-Control'] = ''
    @records = Parte.find(:all)
  end



end

