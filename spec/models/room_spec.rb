require 'rails_helper'

describe Room do
  before do
    @user = FactoryBot.create(:user)
    @rooms_param = {
        home_type: 'マンション・アパート',
        room_type: '個室',
        accommodate: 4,
        bedroom_number: 2,
        bathroom_number: 1,
        price: 50000,
        title: 'ルイージマンション',
        description: 'お化け出るので掃除機で吸ってね！',
        location: '画面の中'
    }
  end

  it 'userに紐づいたRoomの保存は成功する' do
    room = @user.rooms.create(@rooms_param)
    expect(room.valid?).to eq(true)
  end

  describe 'リレーションテスト' do
    it 'userに紐づかないRoomの保存は失敗する' do
      room = Room.create(@rooms_param)
      expect(room.valid?).to eq(false)
    end

    it 'userを削除すると紐づいたroomsも消えること' do
      @user.rooms.create(@rooms_param)
      expect{@user.destroy}.to change{ Room.count }.by(-1)
    end
  end

  describe 'バリデーションテスト' do
    before do
      @presence_true_params = [:home_type,
                               :room_type,
                               :accommodate,
                               :bedroom_number,
                               :bathroom_number,
                               :price,
                               :title,
                               :description,
                               :location]
    end

    it '入力必須項目のいずれかが空の時、保存しない' do
      @presence_true_params.each do |presence_true_param|
        @rooms_param[presence_true_param] = ''
        room = @user.rooms.create(@rooms_param)
        expect(room.valid?).to eq(false)
      end
    end
  end
  
end