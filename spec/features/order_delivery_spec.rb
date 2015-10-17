require 'rails_helper'

describe 'Customer orders a delivery' do

  context '#logged_in' do
    before(:each) do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    scenario 'Signed customer orders for a delivery' do
      visit '/'

      click_link 'order'
      fill_in 'To', with: 'My home'
      fill_in 'From', with: "Polaca's home"
      fill_in 'What', with: 'guitar'

      click_button 'Bring it to me NOW!'

      expect(page).to have_content('Your delivery is registred')
    end
  end

end
