# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

HoboIntranetSartu::Application.routes.draw do


  # Lifecycle routes for controller "users"
  post 'users/signup(.:format)' => 'users#do_signup', :as => 'do_user_signup'
  get 'users/signup(.:format)' => 'users#signup', :as => 'user_signup'
  put 'users/:id/reset_password(.:format)' => 'users#do_reset_password', :as => 'do_user_reset_password'
  get 'users/:id/reset_password(.:format)' => 'users#reset_password', :as => 'user_reset_password'

  # Resource routes for controller "users"
  get 'users/:id/edit(.:format)' => 'users#edit', :as => 'edit_user'
  get 'users/:id(.:format)' => 'users#show', :as => 'user', :constraints => { :id => %r([^/.?]+) }
  post 'users(.:format)' => 'users#create', :as => 'create_user'
  put 'users/:id(.:format)' => 'users#update', :as => 'update_user', :constraints => { :id => %r([^/.?]+) }
  delete 'users/:id(.:format)' => 'users#destroy', :as => 'destroy_user', :constraints => { :id => %r([^/.?]+) }

  # Show action routes for controller "users"
  get 'users/:id/account(.:format)' => 'users#account', :as => 'user_account'

  # User routes for controller "users"
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'


  # Resource routes for controller "proyectos"
  get 'proyectos(.:format)' => 'proyectos#index', :as => 'proyectos'
  get 'proyectos/new(.:format)', :as => 'new_proyecto'
  get 'proyectos/:id/edit(.:format)' => 'proyectos#edit', :as => 'edit_proyecto'
  get 'proyectos/:id(.:format)' => 'proyectos#show', :as => 'proyecto', :constraints => { :id => %r([^/.?]+) }
  post 'proyectos(.:format)' => 'proyectos#create', :as => 'create_proyecto'
  put 'proyectos/:id(.:format)' => 'proyectos#update', :as => 'update_proyecto', :constraints => { :id => %r([^/.?]+) }
  delete 'proyectos/:id(.:format)' => 'proyectos#destroy', :as => 'destroy_proyecto', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "itemgestions"
  get 'itemgestions(.:format)' => 'itemgestions#index', :as => 'itemgestions'
  get 'itemgestions/new(.:format)', :as => 'new_itemgestion'
  get 'itemgestions/:id/edit(.:format)' => 'itemgestions#edit', :as => 'edit_itemgestion'
  get 'itemgestions/:id(.:format)' => 'itemgestions#show', :as => 'itemgestion', :constraints => { :id => %r([^/.?]+) }
  post 'itemgestions(.:format)' => 'itemgestions#create', :as => 'create_itemgestion'
  put 'itemgestions/:id(.:format)' => 'itemgestions#update', :as => 'update_itemgestion', :constraints => { :id => %r([^/.?]+) }
  delete 'itemgestions/:id(.:format)' => 'itemgestions#destroy', :as => 'destroy_itemgestion', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "partes"
  get 'partes/new(.:format)', :as => 'new_parte'
  get 'partes/:id/edit(.:format)' => 'partes#edit', :as => 'edit_parte'
  post 'partes(.:format)' => 'partes#create', :as => 'create_parte'
  put 'partes/:id(.:format)' => 'partes#update', :as => 'update_parte', :constraints => { :id => %r([^/.?]+) }
  delete 'partes/:id(.:format)' => 'partes#destroy', :as => 'destroy_parte', :constraints => { :id => %r([^/.?]+) }

  namespace :admin do


    # Resource routes for controller "admin/zonas"
    get 'zonas(.:format)' => 'zonas#index', :as => 'zonas'
    get 'zonas/new(.:format)', :as => 'new_zona'
    get 'zonas/:id/edit(.:format)' => 'zonas#edit', :as => 'edit_zona'
    get 'zonas/:id(.:format)' => 'zonas#show', :as => 'zona', :constraints => { :id => %r([^/.?]+) }
    post 'zonas(.:format)' => 'zonas#create', :as => 'create_zona'
    put 'zonas/:id(.:format)' => 'zonas#update', :as => 'update_zona', :constraints => { :id => %r([^/.?]+) }
    delete 'zonas/:id(.:format)' => 'zonas#destroy', :as => 'destroy_zona', :constraints => { :id => %r([^/.?]+) }


    # Resource routes for controller "admin/users"
    get 'users(.:format)' => 'users#index', :as => 'users'
    get 'users/new(.:format)', :as => 'new_user'
    get 'users/:id/edit(.:format)' => 'users#edit', :as => 'edit_user'
    get 'users/:id(.:format)' => 'users#show', :as => 'user', :constraints => { :id => %r([^/.?]+) }
    post 'users(.:format)' => 'users#create', :as => 'create_user'
    put 'users/:id(.:format)' => 'users#update', :as => 'update_user', :constraints => { :id => %r([^/.?]+) }
    delete 'users/:id(.:format)' => 'users#destroy', :as => 'destroy_user', :constraints => { :id => %r([^/.?]+) }


    # Resource routes for controller "admin/clientes"
    get 'clientes(.:format)' => 'clientes#index', :as => 'clientes'
    get 'clientes/new(.:format)', :as => 'new_cliente'
    get 'clientes/:id/edit(.:format)' => 'clientes#edit', :as => 'edit_cliente'
    get 'clientes/:id(.:format)' => 'clientes#show', :as => 'cliente', :constraints => { :id => %r([^/.?]+) }
    post 'clientes(.:format)' => 'clientes#create', :as => 'create_cliente'
    put 'clientes/:id(.:format)' => 'clientes#update', :as => 'update_cliente', :constraints => { :id => %r([^/.?]+) }
    delete 'clientes/:id(.:format)' => 'clientes#destroy', :as => 'destroy_cliente', :constraints => { :id => %r([^/.?]+) }


    # Resource routes for controller "admin/entidads"
    get 'entidads(.:format)' => 'entidads#index', :as => 'entidads'
    get 'entidads/new(.:format)', :as => 'new_entidad'
    get 'entidads/:id/edit(.:format)' => 'entidads#edit', :as => 'edit_entidad'
    get 'entidads/:id(.:format)' => 'entidads#show', :as => 'entidad', :constraints => { :id => %r([^/.?]+) }
    post 'entidads(.:format)' => 'entidads#create', :as => 'create_entidad'
    put 'entidads/:id(.:format)' => 'entidads#update', :as => 'update_entidad', :constraints => { :id => %r([^/.?]+) }
    delete 'entidads/:id(.:format)' => 'entidads#destroy', :as => 'destroy_entidad', :constraints => { :id => %r([^/.?]+) }


    # Resource routes for controller "admin/actividades"
    get 'actividades(.:format)' => 'actividades#index', :as => 'actividades'
    get 'actividades/new(.:format)', :as => 'new_actividad'
    get 'actividades/:id/edit(.:format)' => 'actividades#edit', :as => 'edit_actividad'
    get 'actividades/:id(.:format)' => 'actividades#show', :as => 'actividad', :constraints => { :id => %r([^/.?]+) }
    post 'actividades(.:format)' => 'actividades#create', :as => 'create_actividad'
    put 'actividades/:id(.:format)' => 'actividades#update', :as => 'update_actividad', :constraints => { :id => %r([^/.?]+) }
    delete 'actividades/:id(.:format)' => 'actividades#destroy', :as => 'destroy_actividad', :constraints => { :id => %r([^/.?]+) }

  end

end
