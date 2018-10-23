require 'rails_helper'

RSpec.describe 'ログインテスト' do
  before do
    User.create!(email: 'example@aa.co.jp', password: 'example')
    visit new_user_session_path
  end

  it 'フォーム未入力の場合はsign_inページにリダイレクトし、エラーメッセージを表示する' do

    click_button 'Log in'

    expect(page).to have_content('Eメールまたはパスワードが違います。')
  end

  it '正しいEmail、パスワードを入力した場合はログインに成功する' do

    fill_in 'user[email]', with: 'example@aa.co.jp'
    fill_in 'user[password]', with: 'example'
    click_button 'Log in'

    expect(page).to have_text('ログインしました。')
  end

  it '未登録のEmailを入力した場合は「Eメールまたはパスワードが違います。」のエラーメッセージを表示する' do

    fill_in 'user[email]', with: 'exale@aa.co.jp'
    fill_in 'user[password]', with: 'example'
    click_button 'Log in'

    expect(page).to have_content('Eメールまたはパスワードが違います。')
  end

  it '誤ったパスワードを入力した場合は「Eメールまたはパスワードが違います。」のエラーメッセージを表示する' do

    fill_in 'user[email]', with: 'exalme@aa.co.jp'
    fill_in 'user[password]', with: 'exampl'
    click_button 'Log in'

    expect(page).to have_content('Eメールまたはパスワードが違います。')
  end

end