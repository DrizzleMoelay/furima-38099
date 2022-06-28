class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status_info
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  
  validates :name, :description, :price, presence: true

  validatable :category_id,        numericality: { other_than: 1, message: "can't be blank"}
  validatable :status_info_id,     numericality: { other_than: 1 ,message: "can't be blank"}
  validatable :shipping_charge_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validatable :shipping_area_id,   numericality: { other_than: 0 ,message: "can't be blank"}
  validatable :days_to_ship_id,    numericality: { other_than: 1 ,message: "can't be blank"}
end
