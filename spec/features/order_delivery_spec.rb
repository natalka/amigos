require 'rails_helper'

describe 'Customer orders a delivery' do

  context '#logged_in' do
    before(:each) do
      @user = FactoryGirl.create(:customer)
      login_as(@user, :scope => :user)
    end

    let!(:order) { FactoryGirl.create(:order, user: @user) }

    scenario 'List my orders' do
      visit '/'
      expect(page).to have_css('table tr.order')
    end

    scenario 'customer orders for a delivery' do
      visit '/'

      click_link 'order'
      fill_in 'To', with: 'My home'
      fill_in 'From', with: "Polaca's home"
      fill_in 'What', with: 'guitar'

      click_button 'Bring it to me NOW!'

      expect(page).to have_content('Your delivery is registred')
    end

    context 'when required fields are not filled in' do
      scenario 'customer cannot make an order' do
        visit '/'

        click_link 'order'
        fill_in 'To', with: 'My home'
        fill_in 'What', with: 'socks'

        click_button 'Bring it to me NOW!'

        expect(current_path).to eq(orders_path)
      end
    end
  end

end
