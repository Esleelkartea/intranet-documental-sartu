# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121003104739) do

  create_table "actividad_proyectos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "actividad_id"
    t.integer  "proyecto_id"
  end

  add_index "actividad_proyectos", ["actividad_id"], :name => "index_actividad_proyectos_on_actividad_id"
  add_index "actividad_proyectos", ["proyecto_id"], :name => "index_actividad_proyectos_on_proyecto_id"

  create_table "actividades", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cliente_proyectos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.integer  "proyecto_id"
  end

  add_index "cliente_proyectos", ["cliente_id"], :name => "index_cliente_proyectos_on_cliente_id"
  add_index "cliente_proyectos", ["proyecto_id"], :name => "index_cliente_proyectos_on_proyecto_id"

  create_table "clientes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entidad_proyectos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proyecto_id"
    t.integer  "entidad_id"
  end

  add_index "entidad_proyectos", ["entidad_id"], :name => "index_entidad_proyectos_on_entidad_id"
  add_index "entidad_proyectos", ["proyecto_id"], :name => "index_entidad_proyectos_on_proyecto_id"

  create_table "entidads", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itemgestions", :force => true do |t|
    t.string   "tipo"
    t.string   "name"
    t.date     "fecha"
    t.decimal  "cantidad",      :precision => 8, :scale => 2
    t.boolean  "pendiente",                                   :default => true
    t.text     "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proyecto_id"
    t.integer  "cliente_id"
    t.string   "etiquetas"
  end

  add_index "itemgestions", ["cliente_id"], :name => "index_itemgestions_on_cliente_id"
  add_index "itemgestions", ["proyecto_id"], :name => "index_itemgestions_on_proyecto_id"

  create_table "partes", :force => true do |t|
    t.string   "anho"
    t.string   "semana"
    t.integer  "horas"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proyecto_id"
    t.integer  "actividad_id"
    t.integer  "user_id"
  end

  add_index "partes", ["actividad_id"], :name => "index_partes_on_actividad_id"
  add_index "partes", ["proyecto_id"], :name => "index_partes_on_proyecto_id"
  add_index "partes", ["user_id"], :name => "index_partes_on_user_id"

  create_table "proyecto_users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "proyecto_id"
  end

  add_index "proyecto_users", ["proyecto_id"], :name => "index_proyecto_users_on_proyecto_id"
  add_index "proyecto_users", ["user_id"], :name => "index_proyecto_users_on_user_id"

  create_table "proyectos", :force => true do |t|
    t.string   "name"
    t.date     "fecha_inicio"
    t.date     "fecha_cierre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "zona_id"
    t.integer  "num_h_destinatarios"
    t.integer  "num_m_destinatarias"
    t.text     "observaciones"
    t.string   "etiquetas"
    t.string   "prioridad",           :default => "baja"
  end

  add_index "proyectos", ["zona_id"], :name => "index_proyectos_on_zona_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

  create_table "zonas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
