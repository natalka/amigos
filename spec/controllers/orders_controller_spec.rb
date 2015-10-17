require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  context 'Create an order' do
    it 'should create an order with the correct params' do
      expect{
        post :create, order: { to: 'My home', from: 'somewhere', item_desc: 'my bass guitar' }  
      }.to change{ Order.count }.by(1)
    end
  end

end
