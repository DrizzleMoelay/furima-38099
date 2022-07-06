class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :street_no, :phone_no, :building_name, :purchase_record_id, :item_id, :user_id

  with_options presence: true do
    validates :item_id, :user_id, :city, :street_no, :phone_no 
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id,   numericality: { other_than: 0 ,message: "can't be blank"}
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, street_no: street_no, phone_no: phone_no, building_name: building_name)
  end

end