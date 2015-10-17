require 'rails_helper'

describe SearchController, type: :controller do

  context 'search location' do
    it 'should search location using HereApi::Geolocation service' do
      expect(HereApi::Geolocation).to receive(:search_options).with('Alexander Platz')

      get :index, location_name: 'Alexander Platz', format: :json
      expect(response).to be_success
    end
  end

end