require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe '#logged_in' do
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    context 'Create an order' do
      it 'should create an order with the correct params' do
        expect{
          post :create, order: { to: 'My home', from: 'somewhere', item_desc: 'my bass guitar' }
        }.to change{ Order.count }.by(1)
      end
    end
  end


end
