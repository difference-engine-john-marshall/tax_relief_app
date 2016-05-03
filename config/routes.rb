Rails.application.routes.draw do


  devise_for :admins
  get '/admins/new' => 'admins#new'
  post '/admins/create' => 'admins#create'

  root 'questions#home'

  get '/' => 'questions#home'
  get '/questions_index' => 'questions#index'
  get '/questions_index/new' => 'questions#new'
  post '/questions_index' => 'questions#create'

  get '/faq' => 'faqs#index', as: :faqs
  get '/faq/new' => 'faqs#new'
  post '/faq' => 'faqs#create'
  get '/faq/:id/edit' => 'faqs#edit'
  patch '/faq/:id' => 'faqs#update'

  get '/questions/classic' => 'questions#classic'
  get '/questions/equitable' => 'questions#equitable'
  get '/questions' => 'questions#show'
  get '/questions_index/:id/edit' => 'questions#edit'
  patch '/questions_index/:id' => 'questions#update'
  delete '/questions_index/:id' => 'questions#destroy'

  namespace :api do
    namespace :v1 do
      get '/questions' => 'questions#index'
    end
  end

end
