Rails.application.routes.draw do
  get '/todo_item', to: 'todo_item#index'
  post '/todo_item', to: 'todo_item#create'
  get '/todo_item/:id', to: 'todo_item#show'
  put '/todo_item/:id', to: 'todo_item#update'
  delete '/todo_item/:id', to: 'todo_item#destroy'

  get '/todo', to: 'todo#index'
  post '/todo', to: 'todo#create'
  get '/todo/:id', to: 'todo#show'
  put '/todo/:id', to: 'todo#update'
  delete '/todo/:id', to: 'todo#destroy'
end
