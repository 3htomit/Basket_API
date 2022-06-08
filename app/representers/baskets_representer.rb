class BasketsRepresenter
  def initialize(baskets)
    @baskets = baskets
  end

  def as_json
    baskets.map do |basket|
      BasketRepresenter.new(basket).as_json
    end
  end

  private

  attr_reader :baskets
end
