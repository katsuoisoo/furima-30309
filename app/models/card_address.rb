class CardAddress
  include ActiveModel::Model
  attr_accessor  :token, :postal, :prefecture_id, :city, :address, :building_name, :phone, :user_id, :item_id, :user_item_id

  with_options presence: true do
    validates :token
    validates :postal
    validates :prefecture_id,  numericality: { other_than: 1, message: 'select'} 
    validates :city
    validates :address
    validates :phone
  end

  validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message:'code input correctly'}
  validates :phone, length: { maximum: 11, message: 'is too long (maximum is 11 characters)'}
  validates :phone, format: { with: /(0{1}\d{9,10})/, message: 'input only number'}
  

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone: phone, user_item_id: user_item.id)
  end

end