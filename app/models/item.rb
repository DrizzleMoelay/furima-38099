class Item < ApplicationRecord
  belongs_to :user
  #has_one    :purchase_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status_info
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  
  validates :image, :name, :description, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, presence: true
  validates :category_id,        numericality: { other_than: 1, message: "can't be blank"}
  validates :status_info_id,     numericality: { other_than: 1 ,message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :shipping_area_id,   numericality: { other_than: 0 ,message: "can't be blank"}
  validates :days_to_ship_id,    numericality: { other_than: 1 ,message: "can't be blank"}
end
