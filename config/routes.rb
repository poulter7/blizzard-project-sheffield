Blizzard::Application.routes.draw do

  devise_for :users

  match "section/:section_id/answer/:index/answer" => "answer#answer", :as => 'answer_section_task'
  match "/listeningtest/completed" => "listeningtest#completed"
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

  # Resource route (maps HTTP verbs to controller actions automatically):
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

  # Specify a new homepage
  # just remember to delete public/index.html.
  root :to => 'base#index'
end
