Rails.application.routes.draw do

  resources :interventions
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :elevators
  resources :batteries
  resources :customers
  resources :addresses

  resources :columns
  resources :building_details
  resources :buildings

  resource :quotes
  resource :leads

  resource :employees

  ActiveAdmin.routes(self)
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  #admin_root ''

  # GET routes
  get 'emp_interventions' => 'pages#emp_interventions'
  get 'quote' => 'quotes#quote'
  get 'corporate' => 'pages#corporate'
  get 'residential' => 'pages#residential'
  get 'index' => 'pages#index'
  get 'admin_root' => 'elevators#index'
  get 'googledcf02c3ead535472.html' => 'pages#googledcf02c3ead535472.html'

  get 'get_buildings_by_customer/:customers_id', to: 'buildings#get_buildings_by_customer'  
  get '/building_search' => 'buildings#building_search'

  # POST routes

  post 'quote/create' => 'quotes#create'
  post 'contact/create' => 'leads#create'

  resources :dashboard do
    get 'speak', :on => :collection
  end
  
end

