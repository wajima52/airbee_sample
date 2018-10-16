require 'rails_helper'

describe 'Routes' do

  # before do
  #   @user = FactoryBot.create(:user)
  # end

  describe "LoomController" do


    it 'rooms#index' do
      expect(get: '/rooms').to route_to(
                                  controller: 'rooms',
                                  action: 'index'
                              )
    end
  end
end