require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'home index' do
    it 'Should be successfull' do
      get :index
      expect( response ).to be_success
    end
  end

end