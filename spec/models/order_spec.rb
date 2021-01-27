require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入処理' do

    context '商品購入処理がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it 'building以外のすべての値が正しく入力されていれば保存できること' do
        @order.building = ""
        expect(@order).to be_valid
      end
    end

    context '商品購入処理がうまくいかないとき' do
      it 'priceが空だと保存できないこと' do
        @order.price = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Price can't be blank") 
      end
      it 'tokenが空だと保存できないこと' do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank") 
      end
      it 'zipが空だと保存できないこと' do
        @order.zip = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip can't be blank") 
      end
      it 'zipに"-(ハイフン)"が含まれていないと保存できないこと' do
        @order.zip = 0000000
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip must be Half-width numbers and included hyphen(-)") 
      end
      it 'zipの"-(ハイフン)"の前に半角数字が３つ含まれていないと保存できないこと' do
        @order.zip = "00-0000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip must be Half-width numbers and included hyphen(-)") 
      end
      it 'zipの"-(ハイフン)"の後に半角数字が４つ含まれていないと保存できないこと' do
        @order.zip = "000-000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip must be Half-width numbers and included hyphen(-)") 
      end
      it 'zipの"-(ハイフン)"以外が半角数字でないと保存できないこと' do
        @order.zip = "０００-００００"
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip must be Half-width numbers and included hyphen(-)") 
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank") 
      end
      it 'prefecture_idの値が"0"だと保存できないこと' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be selected") 
      end
      it 'cityが空だと保存できないこと' do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank") 
      end
      it 'house_numが空だと保存できないこと' do
        @order.house_num = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("House num can't be blank") 
      end
      it 'phone_numが空だと保存できないこと' do
        @order.phone_num = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num can't be blank") 
      end
      it 'phone_numが全角数字だと保存できないこと' do
        @order.phone_num = "０９０１２３４５６７８"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num must be Half-width numbers") 
      end
      it 'phone_numが半角英字だと保存できないこと' do
        @order.phone_num = "abcdefghijk"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num must be Half-width numbers") 
      end
      it 'user_idが空だと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank") 
      end
      it 'item_idが空だと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank") 
      end
    end
  end
end
