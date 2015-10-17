require 'rails_helper'

describe 'Customer orders a delivery' do

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