class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :region_id, :city, :street_address, :building_name, :phone_number, :purchase_id,
                :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Input 10 or 11 half-width numbers' }
    validates :token
  end

  def save
    purchase = Purchase.create(item_id:, user_id:)
    Address.create(post_code:, region_id:, city:, street_address:,
                   building_name:, phone_number:, purchase_id: purchase.id)
  end
end
