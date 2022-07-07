require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '購入' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる'  do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameは空でも購入できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入できない場合' do

      it "tokenが空では購入できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では購入できない' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeが半角文字ではないと購入できない' do
        @purchase_address.postal_code = '１２３４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it 'postal_codeがハイフンなしでは購入できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it 'postal_codeが「3桁ハイフン4桁」ではないと購入できない' do
        @purchase_address.postal_code = '1234-567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it 'shipping_area_idが空では購入できない' do
        @purchase_address.shipping_area_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Shipping area can't be blank"
      end

      it 'shipping_area_idに「---」が選択されている場合は出品できない' do
        @purchase_address.shipping_area_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Shipping area can't be blank"
      end

      it 'cityが空では購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "City can't be blank"
      end

      it 'street_noが空では購入できない' do
        @purchase_address.street_no = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Street no can't be blank"
      end

      it 'phone_noが空では購入できない' do
        @purchase_address.phone_no = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone no is invalid"
      end

      it 'phone_noが半角数値ではないと購入できない' do
        @purchase_address.phone_no = '０９０１１１１２２２２'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone no is invalid"
      end

      it 'phone_noが9桁以下では購入できない' do
        @purchase_address.phone_no = '090111122'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone no is invalid"
      end

      it 'phone_noが12桁以上では購入できない' do
        @purchase_address.phone_no = '0901111222233'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone no is invalid"
      end

      it 'phone_noがハイフンが入っていいると購入できない' do
        @purchase_address.phone_no = '090-1111-2222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone no is invalid"
      end

    end

  end

end
