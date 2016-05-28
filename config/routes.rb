Rails.application.routes.draw do


  get 'dashboards/show'

  devise_for :admins
  get '/dashboard/admins/new' => 'admins#new'
  post '/dashboard/admins/create' => 'admins#create'
  get '/dashboard/admins/edit' => 'admins#edit'
  delete '/dashboard/admins/:id' => 'admins#destroy'

  root 'questions#home'

  get '/' => 'questions#home'
  get '/dashboard' => 'dashboards#show'
  get '/dashboard/questions' => 'questions#index'
  get '/dashboard/questions/new' => 'questions#new'
  post '/dashboard/questions' => 'questions#create'

  get '/faq' => 'faqs#index', as: :faqs
  get '/dashboard/faqs' => 'faqs#faqs_dashboard'
  get '/dashboard/faqs/new' => 'faqs#new'
  post '/dashboard/faqs' => 'faqs#create'
  get '/dashboard/faqs/:id/edit' => 'faqs#edit'
  patch '/dashboard/faqs/:id' => 'faqs#update'
  delete '/dashboard/faqs/:id' => 'faqs#destroy'

  get '/questions/classic' => 'questions#classic'
  get '/questions/equitable' => 'questions#equitable'
  get '/questions' => 'questions#show'
  get '/dashboard/questions/:id/edit' => 'questions#edit'
  patch '/dashboard/questions/:id' => 'questions#update'
  delete '/dashboard/questions/:id' => 'questions#destroy'

  
  get '/dashboard/contents' => 'contents#index'
  get '/dashboard/contents/:id/edit' => 'contents#edit'
  patch '/dashboard/contents/:id' => 'contents#update'

  namespace :api do
    namespace :v1 do
      get '/questions' => 'questions#index'
    end
  end

end
