require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品登録' do
    context '新規登録ができるとき' do
      it 'imageとname,description,category_id, condition_id, shipping_id, area_id, day_idpriceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Description can't be blank")
      end

      it 'category_idが選択されていないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category Select")
      end

      it 'condition_idが選択されていないと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition Select")
      end

      it 'shipping_idが選択されていないと登録できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping Select")
      end

      it 'area_idが選択されていないと登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Area Select")
      end

      it 'day_idが選択されていないと登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Day Select")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end

      it 'priceが300以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price Out of setting range")
      end

      it 'priceが10,000,000以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price Out of setting range")
      end

      it 'priceが全角数字では登録できない' do
        @item.price = '８８８'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price Half-width characters")
      end
    end
  end
end
