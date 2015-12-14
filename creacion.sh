#!/bin/bash

#hobo g resource cliente    name:string
#hobo g resource proyecto   name:string fecha_inicio:date fecha_cierre:date
#hobo g resource oferta     fecha_oferta:date cantidad_oferta:decimal observaciones:text
#hobo g resource pedido     fecha_pedido:date cantidad_pedido:decimal observaciones:text
#hobo g resource denegacion fecha_denegacion  cantida_denegada:decimal observaciones:text

hobo g model cliente_proyecto

hobo g migration


#, :required, :precision => 8, :scale => 2, :default => 0



