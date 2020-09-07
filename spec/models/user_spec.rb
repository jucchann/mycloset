require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
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
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end

        it 'emailが空では登録できない' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
        end

        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
        end

        it 'emailに@がないと登録できない' do
          @user.email = 'kkkgmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
        end

        it 'passwordが空では登録できない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end

        it 'passwordが5文字以下であれば登録できない' do
          @user.password = 'pass0'
          @user.password_confirmation = 'pass0'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
      end
    end
  end
end
