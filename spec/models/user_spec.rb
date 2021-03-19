require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録/ユーザー情報' do
   before do
    @user = FactoryBot.build(:user)
   end

   context '新規登録できるとき' do
    it '全て存在していれば登録できる' do
      expect(@user).to be_valid
    end
   end


    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'aaaa.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end

      it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it '半角数字のみでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end

      it '全角では登録できない' do
      @user.password = 'Ａ１Ａ１Ａ１'
      @user.password_confirmation = 'Ａ１Ａ１Ａ１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      end

     it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
        @user.family_name =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.family_name ='a'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name is invalid")
      end

       it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
        @user.first_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
       end

       it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
        @user.family_name_kana =' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
       end

       it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana ='あ','Ａ','１','漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include( "First name kana is invalid")
       end

       it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.family_name_kana ='あ','Ａ','１','漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name kana is invalid")
       end

       it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
       end


    end

  end
end
