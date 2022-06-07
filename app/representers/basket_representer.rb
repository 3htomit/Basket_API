class BasketRepresenter
  def initialize(basket)
    @basket = basket
  end

  def basket_calculator(items, options = {})
    total = 0
    items.each do |item|
      total += item.price * item.quantity
    end
    # puts total
    total *= (1 - (options[:discount] || 0))
    # puts options[:discount]
    # puts total
    total *= 1.1
    # puts total
    total += (options[:shipment] || 5)
    # puts total.to_i
    total = total.to_i
  end

  def as_json
    basket_data = {
      items: [],
      total: 0
    }
    basket.items.each do |item|
      basket_data[:items].push({
        id: item.id,
        price: item.price,
        quantity: item.quantity
      })
    end
    basket_data[:total] = basket_calculator(basket.items, options: { discount: 0.1, shipment: 10 })
    basket_data
  end

  private

  attr_reader :basket
end
