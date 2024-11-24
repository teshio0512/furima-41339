class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :region_id, :city, :street_address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Input 10 or 11 half-width numbers' }
    validates :purchase_id
  end

  def save
    purchase = Purchase.create(item_id: params[:item_id], user_id: current_user.id)
    Address.create(post_code: @purchase_address.post_code, region_id: @purchase_address.region_id, city: @purchase_address.city, street_address: @purchase_address.street_address,
                   building_name: @purchase_address.building_name, phone_number: @purchase_address.phone_number, purchase_id: purchase.id)
  end
end
