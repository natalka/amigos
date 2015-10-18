require 'rails_helper'

describe 'Customer orders a delivery' do

  context '#logged_in' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @deliverer = FactoryGirl.create(:deliverer)
      login_as(@deliverer, :scope => :user)
    end

    let!(:order) { FactoryGirl.create(:order, user: @user) }

    scenario 'List my orders to deliverer' do
      visit '/orders'
      expect(page).to have_css('table tr.order')
    end
    
  end

end
