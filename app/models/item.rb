class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :fee
  belongs_to :region
  belongs_to :day

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, numericality: { only_integer: true, in: 300..9_999_999 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true, blob: { content_type: :image }
end
