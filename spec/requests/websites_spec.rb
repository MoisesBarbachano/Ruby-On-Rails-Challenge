require 'rails_helper'

RSpec.describe 'Websites', type: :request do
  describe 'POST /create' do
    let(:long_url) { SecureRandom.hex(10) }

    shared_examples_for 'a successful request' do
      it 'returns short_url created successfully' do
        expect(response).to have_http_status(:success)
        expect(response.body).to include('short_url')
        expect(JSON.parse(response.body)['short_url']).to eq("http://localhost:3000/#{expected_short_url}")
      end
    end

    context 'when long_url is present' do
      let(:expected_short_url) { 'b' } # FIRST REQUEST

      before { post '/websites', params: { long_url: long_url }, as: :json }

      it_behaves_like 'a successful request'
    end

    context 'when same long_url has been requested two times' do
      let(:expected_short_url) { 'd' } # FROM LAST REQUEST

      before do
        post '/websites', params: { long_url: long_url }, as: :json
        post '/websites', params: { long_url: long_url }, as: :json
      end
      
      it_behaves_like 'a successful request'

      it 'Website was updated successfully' do
        expect(Website.first.visited).to eq(2)
      end
    end
  end
end
