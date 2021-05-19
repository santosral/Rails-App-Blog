Rails.application.routes.draw do
  get '/articles' => 'articles#index'

  get '/articles/new' => 'articles#new'
  post '/articles/create' => 'articles#create', as: 'article_create'

  get '/articles/:id' => 'articles#show', as: 'article_show'

  delete '/articles/:id/delete' => 'articles#delete', as: 'article_delete'

  get '/articles/:id/edit' => 'articles#edit', as: 'article_edit'
  put '/articles/:id' => 'articles#update', as: 'article_update'
end
