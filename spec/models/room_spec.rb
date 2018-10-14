require 'rails_helper'

RSpec.describe Room do
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
    it 'home_typeが空の時、保存しない' do
      @rooms_param[:home_type] = ''
      room = Room.create(@rooms_param)
      expect(room.valid?).to eq(false)
    end

    it 'room_typeが空の時、保存しない' do
      @rooms_param[:room_type] = ''
      room = Room.create(@rooms_param)
      expect(room.valid?).to eq(false)
    end

    it 'accommodateが空の時、保存しない' do
      @rooms_param[:accommodate] = ''
      room = Room.create(@rooms_param)
      expect(room.valid?).to eq(false)
    end
  end





end