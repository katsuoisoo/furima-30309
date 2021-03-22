require 'rails_helper'

RSpec.describe CardAddress, type: :model do
  
  before do
    @card_address = FactoryBot.build(:card_address)
  end

  describe '購入者情報の保存' do
    context '保存ができるとき' do
      it 'token,postal,prefecture_id,city,address,phoneが存在すれば登録できる' do
        expect(@card_address).to be_valid
      end
    end

    context '購入保存ができないとき' do

      it 'tokenが空では登録できない' do
        @card_address.token = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include ("Token can't be blank")
      end

      it 'postalが空では登録できない' do
        @card_address.postal = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include ("Postal can't be blank")
      end

      it 'postalにはハイフンがないと登録できない' do
        @card_address.postal = '1234567'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include ("Postal code input correctly")
      end

      it 'prefecture_idが選択されていないと登録できない' do
        @card_address.prefecture_id = 1
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include ("Prefecture select")
      end

      it 'cityが空では登録できない' do
        @card_address.city = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include ("City can't be blank")
      end

      it 'phoneが空では登録できない' do
        @card_address.phone = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include ("Phone can't be blank")
      end

      it 'phoneにハイフンがあると登録できない' do
        @card_address.phone = '090-1234-5678'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include ("Phone input only number")
      end

      it 'phoneは11桁以内でないと登録できない' do
        @card_address.phone = '090123456789'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include ("Phone is too long (maximum is 11 characters)")
      end

    end
  end

end
