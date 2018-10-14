require 'rails_helper'

RSpec.describe 'Room' do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'userを削除するとuserが投稿したroomも削除される' do
    @user.rooms.create(
      home_type: 'マンション・アパート',
      room_type: '個室',
      accommodate: 4,
      bedroom_number: 2,
      bathroom_number: 1,
      price: 50000,
      title: 'ルイージマンション',
      description: 'お化け出るので掃除機で吸ってね！',
      location: '画面の中'
    )

    expect{ @user.destroy }.to change{ Room.count }.by(-1)
  end
end