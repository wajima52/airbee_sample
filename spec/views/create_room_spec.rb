require 'rails_helper'

RSpec.describe 'Create Room Action' do

  it '未ログイン時にnewにアクセスした場合、ログイン画面に遷移し、エラーメッセージを表示する' do
    visit new_room_path
    # click_button "投稿する"

    expect(page).to have_content("アカウント登録もしくはログインしてください。")
  end

  
end