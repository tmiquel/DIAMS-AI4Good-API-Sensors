# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Data API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:Data) { create_list(:datum, 10) }
  let(:datum_id) { Datum.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /data
  describe 'GET /data' do
    # make HTTP get request before each example
    before { get '/data', params: {}, headers: headers  }

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
    before { get "/data/#{datum_id}", params: {}, headers: headers  }

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
    let(:valid_attributes) { { devise: 'Anne', PM2_5: '3', PM10: '4', feeling: '6', latitude: '-14.7', longitude: '139.4' }.to_json }

    context 'when the request is valid' do
      before { post '/data', params: valid_attributes, headers: headers  }

      it 'creates a datum' do
        expect(json['devise']).to eq('Anne')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { devise: "" }.to_json }
      before { post '/data', params: invalid_attributes, headers: headers  }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['devise'])
          .to match(["can't be blank", "is too short (minimum is 1 character)"])
      end
    end
  end

  # Test suite for PUT /data/:id
  describe 'PUT /data/:id' do
    let(:valid_attributes) { { devise: 'sac de Thibaut' }.to_json }

    context 'when the record exists' do
      before { put "/data/#{datum_id}", params: valid_attributes, headers: headers  }

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
    before { delete "/data/#{datum_id}", params: {}, headers: headers  }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
