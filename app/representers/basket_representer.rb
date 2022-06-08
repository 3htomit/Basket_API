class BasketRepresenter
  def initialize(basket)
    @basket = basket
  end

  def calculate_total(items, **options)
    total = 0
    vat = 1.1
    items.each do |item|
      total += item.price * item.quantity
    end
    if total.zero?
      total=0
    else
      total *= (1 - (options[:discount] || 0))
      total *= vat
      total += (options[:shipment] || 5)
    end
    total = total.round(2)
  end

  def as_json
    basket_data = {
      basket_id: 0,
      items: [],
      total: 0
    }
    basket.items.each do |item|
      basket_data[:items].push({
        item_id: item.id,
        price: item.price,
        quantity: item.quantity
      })
    end
    basket_data[:basket_id] = basket.id
    basket_data[:total] = calculate_total(basket.items, discount: 0.1, shipment: 7)
    basket_data
  end

  private

  attr_reader :basket
end