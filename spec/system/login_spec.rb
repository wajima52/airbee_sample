require 'rspec'

describe 'ログイン機能', type: :system do

  it 'ログイン成功する' do
    visit new_user_session_path
    fill_in "user[email]", with: "hanako@aa.com"
    fill_in "user[password]", with: "hanako"
    click_on("Log in")
  end
end