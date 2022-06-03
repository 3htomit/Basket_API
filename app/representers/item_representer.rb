class ItemRepresenter
  def initialize(item)
    @item = item
  end

  def as_json
    {
      id: item.id,
      price: item.price,
      quantity: item.quantity
    }
  end

  private

  attr_reader :item
end
