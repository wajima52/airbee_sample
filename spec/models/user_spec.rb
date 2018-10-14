require 'rails_helper'

RSpec.describe 'User', type: :model do

  describe 'バリデーション' do
    it 'emailとパスワードが設定されていればOK' do
      user = User.create(
                     email: 'hanako@aa.com',
                     password: 'hanako'
      )
      expect(user.valid?).to eq(true)
    end

    it 'emailが空の場合ばNG' do
      user = User.create(
          email: '',
          password: 'hanako'
      )
      expect(user.valid?).to eq(false)
    end

    it 'パスワードが空の場合はNG' do
        user = User.create(
            email: 'hanako@aa.com',
            password: ''
        )
      expect(user.valid?).to eq(false)
    end
  end
end