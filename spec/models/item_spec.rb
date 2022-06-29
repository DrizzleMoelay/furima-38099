require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it 'image,name, description, category_id, status_info_id, shipping_charge_id, shipping_area_id, days_to_ship_idとpriceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  
    context '出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'status_info_idが空では登録できない' do
        @item.status_info_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status info can't be blank"
      end

      it 'shipping_charge_idが空では登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
      end

      it 'shipping_area_idが空では登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
        
      end

      it 'days_to_ship_idが空では登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
        
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
        
      end

      it 'priceが299以下では登録できない' do
        @item.price = '288'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it 'priceが10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end

end
