class ItemsRepresenter
  def initialize(items)
    @items = items
  end

  def as_json
    items.map do |item|
      {
        id: item.id,
        price: item.price,
        quantity: item.quantity
      }
    end
  end

  private

  attr_reader :items
end
