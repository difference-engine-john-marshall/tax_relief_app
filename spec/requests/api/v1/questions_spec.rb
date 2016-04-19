require 'rails_helper'

describe 'Questions API', type: :request do
  it 'gets the index list of questions' do
    question = FactoryGirl.create(:question)

    get '/api/v1/questions.json'

    expect(response).to have_http_status(:success)
    json = JSON.parse(response.body)
    expect(json).to be_a Array
    expect(json[0]['text']).to eq question.text
  end

  it 'returns the list of questions in ascending order of id' do
    question_2 = FactoryGirl.create(:question, id: 2)
    question = FactoryGirl.create(:question, id: 1)

    get '/api/v1/questions.json'
    json = JSON.parse(response.body)

    expect(json[0]['id']).to eq 1
    expect(json[1]['id']).to eq 2
  end

end