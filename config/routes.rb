Rails.application.routes.draw do

  get '/questionsIndex' => 'questions#index'
  get '/questionsIndex/new' => 'questions#new'
  post '/questionsIndex' => 'questions#create'
  get '/questions' => 'questions#show'
  get '/questionsIndex/:id/edit' => 'questions#edit'
  patch '/questionsIndex' => 'questions#update'
  delete '/questionsIndex/:id' => 'questions#destroy'

end
