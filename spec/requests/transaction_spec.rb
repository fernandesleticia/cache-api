require 'rails_helper'

RSpec.describe 'Banck API', type: :request do
    # initialize test data 
    let!(:transactions) { create_list(:transaction, 10) }
    let(:transaction_id) { transactions.first.id }
  
    # Test suite for GET /transactions
    describe 'GET /transactions' do
      # make HTTP get request before each example
      before { get '/transactions' }
  
      it 'returns transactions' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end
  
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  
    # Test suite for GET /transactions/:id
    describe 'GET /transactions/:id' do
      before { get "/transactions/#{transaction_id}" }
  
      context 'when the record exists' do
        it 'returns the transaction' do
          expect(json).not_to be_empty
          expect(json['id']).to eq(transaction_id)
        end
  
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
  
      context 'when the record does not exist' do
        let(:transaction_id) { 100 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
  
        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Transaction/)
        end
      end
    end

    # Test suite for POST /transactions
    describe 'POST /transactions' do
      # valid payload
      let(:valid_attributes) { { date: '2020-12-30', description: 'Begining Balance', reference: 1234567890 } }
  
      context 'when the request is valid' do
        before { post '/transactions', params: valid_attributes }
  
        it 'creates a transaction' do
          expect(json['description']).to eq('Begining Balance')
        end
  
        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end
  
      context 'when the request is invalid' do
        before { post '/transactions', params: { description: 'Amazon Fee' } }
  
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
  
        it 'returns a validation failure message' do
          expect(response.body)
            .to match(/Validation failed: Created by can't be blank/)
        end
      end
    end
  
    # Test suite for PUT /transactions/:id
    describe 'PUT /transactions/:id' do
      let(:valid_attributes) { { description: 'Cheque No. 3' } }
  
      context 'when the record exists' do
        before { put "/transactions/#{transaction_id}", params: valid_attributes }
  
        it 'updates the record' do
          expect(response.body).to be_empty
        end
  
        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end
    end
  
    # Test suite for DELETE /transactions/:id
    describe 'DELETE /transactions/:id' do
      before { delete "/transactions/#{transaction_id}" }
  
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end