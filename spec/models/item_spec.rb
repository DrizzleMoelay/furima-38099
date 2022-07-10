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
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end

      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end

      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end

      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end

      it 'category_idに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end

      it 'status_info_idが空では出品できない' do
        @item.status_info_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end

      it 'status_info_idに「---」が選択されている場合は出品できない' do
        @item.status_info_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end

      it 'shipping_charge_idが空では出品できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end

      it 'shipping_charge_idに「---」が選択されている場合は出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end

      it 'shipping_area_idが空では出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end

      it 'shipping_area_idに「---」が選択されている場合は出品できない' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end

      it 'days_to_ship_idが空では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
        
      end

      it 'days_to_ship_idに「---」が選択されている場合は出品できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
        
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
        
      end

      it 'priceが299以下では出品できない' do
        @item.price = '288'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は300以上の値にしてください"
      end

      it 'priceが10000000以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は9999999以下の値にしてください"
      end

      it 'priceに半角数字以外が含まれている場合は出品できない' do
        @item.price = '100３０'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end

    end
  end

end
