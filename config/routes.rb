Rails.application.routes.draw do

  devise_for :admins
  root 'questions#index'

  get '/faq' => 'faq#index'

  get '/questionsIndex' => 'questions#index'
  get '/questionsIndex/new' => 'questions#new'
  post '/questionsIndex' => 'questions#create'
  get '/questions' => 'questions#show'
  get '/questionsIndex/:id/edit' => 'questions#edit'
  patch '/questionsIndex' => 'questions#update'
  delete '/questionsIndex/:id' => 'questions#destroy'

  namespace :api do
    namespace :v1 do
      get '/questions' => 'questions#index'
    end
  end

end
