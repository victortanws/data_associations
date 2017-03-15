Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "payments#index"
  # Routes for the Debt resource:
  # CREATE
  get "/debts/new", :controller => "debts", :action => "new"
  post "/create_debt", :controller => "debts", :action => "create"

  # READ
  get "/debts", :controller => "debts", :action => "index"
  get "/debts/:id", :controller => "debts", :action => "show"

  # UPDATE
  get "/debts/:id/edit", :controller => "debts", :action => "edit"
  post "/update_debt/:id", :controller => "debts", :action => "update"

  # DELETE
  get "/delete_debt/:id", :controller => "debts", :action => "destroy"
  #------------------------------

  # Routes for the Payment_method resource:
  # CREATE
  get "/payment_methods/new", :controller => "payment_methods", :action => "new"
  post "/create_payment_method", :controller => "payment_methods", :action => "create"

  # READ
  get "/payment_methods", :controller => "payment_methods", :action => "index"
  get "/payment_methods/:id", :controller => "payment_methods", :action => "show"

  # UPDATE
  get "/payment_methods/:id/edit", :controller => "payment_methods", :action => "edit"
  post "/update_payment_method/:id", :controller => "payment_methods", :action => "update"

  # DELETE
  get "/delete_payment_method/:id", :controller => "payment_methods", :action => "destroy"
  #------------------------------

  # Routes for the Payment resource:
  # CREATE
  get "/payments/new", :controller => "payments", :action => "new"
  post "/create_payment", :controller => "payments", :action => "create"

  # READ
  get "/payments", :controller => "payments", :action => "index"
  get "/payments/:id", :controller => "payments", :action => "show"

  # UPDATE
  get "/payments/:id/edit", :controller => "payments", :action => "edit"
  post "/update_payment/:id", :controller => "payments", :action => "update"

  # DELETE
  get "/delete_payment/:id", :controller => "payments", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
