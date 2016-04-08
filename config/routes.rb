Rails.application.routes.draw do
<<<<<<< HEAD

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

=======
  get '/' => 'questions#home'
>>>>>>> 400ae3ec70064aef6049fcb0fe0af59136d53c52
end
