require 'rails_helper'

RSpec.describe "Articles", type: :request do
  # initialize test data
  let!(:articles) { create_list(:article, 10) }
  let(:article_id) { articles.first.id }

  # Test suite for GET /todos
  describe 'GET /articles' do
    # make HTTP get request before each example
    before { get '/articles' }

    it 'returns articles' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /articles/:id' do
    before { get "/articles/#{article_id}" }

    context 'when the record exists' do
      it 'returns the article' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(article_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:article_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Article/)
      end
    end
  end

  # Test suite for POST /todos
  describe 'POST /articles' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rutrum tincidunt pharetra.', author: 'Jainy Lie', user_id: 1} }

    context 'when the request is valid' do
      before { post '/articles', params: valid_attributes }

      it 'creates article' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/articles', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Body can't be blank, Author can't be blank, User can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:id
  describe 'PUT /articles/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/articles/#{article_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /articles/:id' do
    before { delete "/articles/#{article_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
