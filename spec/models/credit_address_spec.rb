require 'rails_helper'

RSpec.describe CreditAddress, type: :model do
  describe '配送先入力' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @credit_address = FactoryBot.build(:credit_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '配送登録ができる時' do
      it '全て存在していれば登録できる' do
        expect(@credit_address).to be_valid
      end
    end

    context '配送登録ができないとき' do
      it 'tokenが空では登録できないこと' do
        @credit_address.token = nil
        @credit_address.valid?
        expect(@credit_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと登録できない' do
        @credit_address.post_code = ''
        @credit_address.valid?
        expect(@credit_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '都道府県が空では登録できない' do
        @credit_address.area_id = 1
        @credit_address.valid?
        expect(@credit_address.errors.full_messages).to include("Area can't be blank")
      end

      it '市区町村が空では登録できない' do
        @credit_address.city = ''
        @credit_address.valid?
        expect(@credit_address.errors.full_messages).to include("City can't be blank")
      end

      it '市区町村は文字のみでないと登録できない' do
        @credit_address.city = '000'
        @credit_address.valid?
        expect(@credit_address.errors.full_messages).to include('City is invalid. Input full-width characters.')
      end

      it '番地が空だと登録できない' do
        @credit_address.house_number = ''
        @credit_address.valid?
        expect(@credit_address.errors.full_messages).to include("House number can't be blank")
      end

      it '郵便番号に（-）がないと登録できない' do
        @credit_address.post_code = '0000000'
        @credit_address.valid?
        expect(@credit_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号は◯◯◯-◯◯◯◯でないと登録できない' do
        @credit_address.post_code = '0000-000'
        @credit_address.valid?
        expect(@credit_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '電話番号が11桁以内でないと登録できない' do
        @credit_address.phone_number = '000000000000'
        @credit_address.valid?
        expect(@credit_address.errors.full_messages).to include('Phone number is invalid.')
      end
    end
  end
end
