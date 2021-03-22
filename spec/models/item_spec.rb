require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の情報入力' do
    before do
     @item = FactoryBot.build(:item)
 end

 context '商品出品ができるとき' do
  it '全て存在していれば登録できる' do
    expect(@item).to be_valid
  end
 end

  context '商品出品ができないとき' do
    it '画像添付がないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Name can't be blank")
    end

    it '商品説明が空では登録できない' do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Introduction can't be blank")
    end

    it 'カテゴリーが空だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category Select")
    end

    it '商品の状態が空だと登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Condition Select")
    end

    it '配送料の負担が空だと登録できない' do
      @item.payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Payer Select")
    end

    it '配送元の地域が空だと登録できない' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Area Select")
   end

   it '配送までの日数が空だと登録できない' do
    @item.delivery_day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include ("Delivery day Select")
   end

    it '販売価格が空だと登録できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price can't be blank")
    end

    it '全角数字では登録できない' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

   it '販売価格が¥299以下だと登録できない' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price Out of setting range")
   end

    it '販売価格が¥10000000以上だと登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price Out of setting range")
    end

  end

end
end
