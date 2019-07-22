require 'rails_helper'

RSpec.describe 'Data API', type: :request do
  # initialize test data 
  let!(:Data) { create_list(:datum, 10) }
  let(:datum_id) { Datum.first.id }

  # Test suite for GET /data
  describe 'GET /data' do
    # make HTTP get request before each example
    before { get '/data' }

    it 'returns Data' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /data/:id
  describe 'GET /data/:id' do
    before { get "/data/#{datum_id}" }

    context 'when the record exists' do
      it 'returns the datum' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(datum_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:datum_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Datum/)
      end
    end
  end

  # Test suite for POST /data
  describe 'POST /data' do
    # valid payload
    let(:valid_attributes) {{ device: 'Anne', PM2_5: '3', PM10: '4', feeling: '6', latitude:  '-14.7', longitude: '139.4'}}

    context 'when the request is valid' do
      before { post '/data', params: valid_attributes }

      it 'creates a datum' do
        expect(json['device']).to eq('Anne')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/data', params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/can't be blank/)
      end
    end
  end

  # Test suite for PUT /data/:id
  describe 'PUT /data/:id' do
    let(:valid_attributes) { { device: 'sac de Thibaut' } }

    context 'when the record exists' do
      before { put "/data/#{datum_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /data/:id
  describe 'DELETE /data/:id' do
    before { delete "/data/#{datum_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end