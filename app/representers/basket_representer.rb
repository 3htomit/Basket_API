class BasketRepresenter
  def initialize(basket)
    @basket = basket
  end

  def basket_calculator(items, **options)
    total = 0
    items.each do |item|
      total += item.price * item.quantity
    end
    total *= (1 - (options[:discount] || 0))
    total *= 1.1
    total += (options[:shipment] || 5)
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
    basket_data[:total] = basket_calculator(basket.items)
    basket_data
  end

  private

  attr_reader :basket
end
