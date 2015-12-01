require 'api_constraints'

Sil::Application.routes.draw do
  devise_for :users
  # API definition
  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1 , default: true) do
  
      resources :users, :only => [:index, :show, :create, :update, :destroy] do
        # collection do 
        #   post 'update/', :action => 'update'
        # end
        # resources :inventory_items, :only => [:create]
      end
      resources :sessions, :only => [:create, :destroy] do
        collection do
          post 'destroy/', :action => 'destroy'
        end
      end
      
    end # scope
  end # namespace
  
end
