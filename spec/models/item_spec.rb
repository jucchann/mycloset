require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品情報の保存' do
    context '商品情報の保存ができるとき' do
      it 'image、category_id、brand_id、color_id、size_idが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報の保存ができないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'category_idが空では登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは数値で入力してください")
      end

      it 'brand_idが空では登録できない' do
        @item.brand = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("ブランドは数値で入力してください")
      end

      it 'color_idが空では登録できない' do
        @item.color = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("色は数値で入力してください")
      end

      it 'size_idが空では登録できない' do
        @item.size = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("サイズは数値で入力してください")
      end
    end
  end
end
