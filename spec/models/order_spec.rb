require "rails_helper"

RSpec.describe Order, :type => :model do

  context 'geo_addresses' do
    let(:order){ FactoryGirl.create(:order) }
    it 'return hash with WAYPOINT0 and WAYPOINT1 addresses for routing' do
      expect( order.geo_addresses ).to eq({ waypoint0: 'geo!52.51916,13.34542', waypoint1: 'geo!52.50948,13.59148' })
    end
  end 

end
