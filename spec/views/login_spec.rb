require 'rails_helper'

RSpec.describe 'ログインテスト' do
  before do
    User.create!(email: 'example@aa.co.jp', password: 'example')
  end

  it 'フォーム未入力の場合はsign_inページにリダイレクトし、エラーメッセージを表示する' do
    visit new_user_session_path

    click_button 'Log in'
    expect(page).to have_content('Eメールまたはパスワードが違います。')
  end

  it '正しいEmail、パスワードを入力した場合はログインに成功する' do
    visit new_user_session_path

    fill_in 'user[email]', with: 'example@aa.co.jp'
    fill_in 'user[password]', with: 'example'
    click_button 'Log in'

    expect(page).to have_text('ログインしました。')
  end


end