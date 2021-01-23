require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品情報の保存' do
    context "出品ができる場合" do
      it "name,info,price,image,category_id,condition_id,charge_id,prefecture_id,ship_day_idが存在すれば出品ができる" do
        expect(@item).to be_valid
      end
      it "priceが¥300~¥9,999,999の間で半角数字のみでの入力であれば出品ができる" do
        @item.price = 1234
        expect(@item).to be_valid
      end
    end

    context "出品ができない場合" do
      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank") 
      end
      it "infoが空では登録できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank") 
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank") 
      end
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank") 
      end
      it "category_idが０(選択されていない状態)では登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be selected") 
      end
      it "category_idが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank") 
      end
      it "condition_idが０(選択されていない状態)では登録できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be selected") 
      end
      it "condition_idが空では登録できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank") 
      end
      it "charge_idが０(選択されていない状態)では登録できない" do
        @item.charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be selected") 
      end
      it "charge_idが空では登録できない" do
        @item.charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank") 
      end
      it "prefecture_idが０(選択されていない状態)では登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be selected") 
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank") 
      end
      it "ship_day_idが０(選択されていない状態)では登録できない" do
        @item.ship_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day must be selected") 
      end
      it "ship_day_idが空では登録できない" do
        @item.ship_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank") 
      end
      it "userが紐づいていないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist") 
      end

      describe "price関連" do
        it "priceが¥300を下回ると出品できない" do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be 300~9999999") 
        end
        it "priceが¥9,999,999を上回ると出品できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be 300~9999999") 
        end
        it "priceが整数で入力されなければ出品できない" do
          @item.price = 500.55
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be Integer") 
        end
        it "priceが半角英数字混合で入力されると出品できない" do
          @item.price = "abcd1234"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be Half-width numbers") 
        end
        it "priceが半角英字で入力されると出品できない" do
          @item.price = "abcdef"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be Half-width numbers") 
        end
        it "priceが全角数字で入力されると出品できない" do
          @item.price = "５０００"  #全角で入力しています
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be Half-width numbers") 
        end
      end

    end
  end
end
