require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'emailに@があれば登録できる' do
        @user.email = 'kkk@gmail.com'
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'password0'
        @user.password_confirmation = 'password0'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do

      end

      it '重複したemailが存在する場合登録できない' do

      end

      it 'emailに@がないと登録できない' do

      end

      it 'passwordが空では登録できない' do
      end

      it 'passwordが5文字以下であれば登録できない' do
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      end
    end
  end
end
