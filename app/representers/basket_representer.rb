class BasketRepresenter
  def initialize(basket)
    @basket = basket
  end

  def as_json
    basket_data = {
      basket_id: 0,
      items: [],
      discount: 0,
      shipment: 5,
      total: basket.total
    }
    basket.items.each do |item|
      basket_data[:items].push({
        item_id: item.id,
        price: item.price,
        quantity: item.quantity
      })
    end
    basket_data[:basket_id] = basket.id
    basket_data[:discount] = basket.discount unless basket.discount.nil?
    basket_data[:shipment] = basket.shipment unless basket.shipment.nil?
    basket_data
  end

  private

  attr_reader :basket
end
