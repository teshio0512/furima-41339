require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname・email・password・password_confirmation・family_name・first_name・kana_family_name・kana_first_name・birthdayが正しく入力されれば登録できる' do
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
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが使用済みのものでは登録できない' do
        user = FactoryBot.create(:user)
        @user.email = user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれない場合は登録できない' do
        @user.email = 'testmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = 'ab12c'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でない場合は登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角で英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角文字を含む場合は登録できない' do
        @user.password = 'Ａbc123'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角で英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角で英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが一致しない場合は登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'ab123c'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_nameが全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.family_name = 'name'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.first_name = 'name'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'kana_family_nameが空では登録できない' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_family_nameが全角(カタカナ)でなければ登録できない' do
        @user.kana_family_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name 全角(カタカナ)を使用してください')
      end
      it 'kana_family_nameに全角(カタカナ)以外の文字(ひらがな・漢字・英数字・記号)が含まれる場合は登録できない' do
        @user.kana_family_name = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name 全角(カタカナ)を使用してください')
      end
      it 'kana_first_nameが全角(カタカナ)でなければ登録できない' do
        @user.kana_first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name 全角(カタカナ)を使用してください')
      end
      it 'kana_first_nameに全角(カタカナ)以外の文字(ひらがな・漢字・英数字・記号)が含まれる場合は登録できない' do
        @user.kana_first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name 全角(カタカナ)を使用してください')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
