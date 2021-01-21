require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dayが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordとpassword_confirmationが６文字以上で半角英数字混合で一致すれば登録できる" do
      @user.password = "abcd1234"
      @user.password_confirmation = "abcd1234"
      expect(@user).to be_valid
    end
    it "last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      @user.last_name = "市ヶや"
      expect(@user).to be_valid
    end
    it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      @user.first_name = "アり咲"
      expect(@user).to be_valid
    end
    it "last_name_kanaが全角（カタカナ）であれば登録できる" do
      @user.last_name_kana = "イチガヤ"
      expect(@user).to be_valid
    end
    it "first_name_kanaが全角（カタカナ）であれば登録できる" do
      @user.first_name_kana = "アリサ"
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = "abcd1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数字混合でない場合は登録できない" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password must be include both letters and numbers")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが一致しなければ登録できない" do
      @user.password = "abc123"
      @user.password_confirmation = "abc1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが全角（漢字・ひらがな・カタカナ）でない場合は登録できない" do
      @user.last_name = "abcd"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name must be Full-width characters")
    end
    it "first_nameが全角（漢字・ひらがな・カタカナ）でない場合は登録できない" do
      @user.first_name = "abcd"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name must be Full-width characters")
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "last_name_kanaが全角（カタカナ）でない場合は登録できない" do
      @user.last_name_kana = "市ヶ谷"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana must be Full-width katkana characters")
    end
    it "first_name_kanaが全角（カタカナ）でない場合は登録できない" do
      @user.first_name_kana = "有咲"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana must be Full-width katkana characters")
    end
    it "birth_dayが空では登録できない" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
