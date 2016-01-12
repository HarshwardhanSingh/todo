Rails.application.routes.draw do

  resources :tasks

  put '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'mark_as_complete' 
  put '/tasks/:id/mark_incomplete', to: 'tasks#mark_incomplete', as: 'mark_as_incomplete' 
end
