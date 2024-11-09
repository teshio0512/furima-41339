require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it 'name, explanation, category_id, state_id, fee_id, region_id, delivery_id, priceが正しく入力され、
          画像ファイルが添付されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'categry_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'state_idが1では出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'fee_idが1では出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'region_idが1では出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'delivery_idが1では出品できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300より小さければ出品できない' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be in 300..9999999')
      end
      it 'priceが9999999より大きければ出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be in 300..9999999')
      end
      it '画像ファイルが添付されていなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
