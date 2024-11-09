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
  with_options presence: true, numericality: { in: 300..9_999_999 },
               format: { with: /\A[0-9]+\z/ } do
    validates :price
  end
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true, blob: { content_type: :image }
end
