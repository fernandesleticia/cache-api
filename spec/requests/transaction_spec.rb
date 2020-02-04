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
  
  end