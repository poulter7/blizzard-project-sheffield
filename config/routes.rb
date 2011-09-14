Blizzard::Application.routes.draw do

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  match "section/:section_id/answer/:index/answer" => "answer#answer", :as => 'answer_section_task'
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :section do
    resources :answer
  end
  resources :answer
  resources :participant
  resources :user do
    get 'block'
  end

  resources :listeningtest

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  get "base/index"
  get "base/turk"
  get "base/taskrender"
  match "/resources" => "resource#list"
  match "/users" => "user#list"
  match "/turk" => "base#turk"
  match "/taskrender" => "base#taskrender"
  match "/amazon" => "amazon#welcome"
 
  # different reactions to queries which are made to the amazon page
  match "/amazon/outside" => "amazon#outside"
  match "/amazon/pending" => "amazon#pending"
  match "/amazon/task" => "amazon#task"

#  match "/register" => "devise/users#new"
  # to a user this is going to be a "test" this is the only place "test should be used
#  namespace :user do
#        root :to => "base#test"
#  end


  # Specify a new homepage
  # just remember to delete public/index.html.
  root :to => 'base#index'
end

# You can have the root of your site routed with "root"
# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id(.:format)))'
