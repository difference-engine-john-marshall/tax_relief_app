Rails.application.routes.draw do

  get '/questions_index' => 'questions#index'
  get '/questions_index/new' => 'questions#new'
  post '/questions_index' => 'questions#create'
  get '/questions' => 'questions#show'
  get '/questionsIndex/:id/edit' => 'questions#edit'
  patch '/questions_index' => 'questions#update'
  delete '/questions_index/:id' => 'questions#destroy'

  namespace :api do
    namespace :v1 do
      get '/questions' => 'questions#index'
    end
  end

end
