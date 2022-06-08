require 'rails_helper'

describe BasketRepresenter, type: :representer do
  describe 'CalculateTotal' do
    let(:item1) {FactoryBot.create(:item, price: 15, quantity: 2)}
    let(:item2) {FactoryBot.create(:item, price: 20, quantity: 1)}
    let(:item3) {FactoryBot.create(:item, price: 5, quantity: 4)}
    let(:items1) {[item1, item3]}
    let(:items2) {[item1, item2]}

    it 'calculates the total of items with options' do
      # total = calculate_total(items1, discount: 0.1, shipment: 10)

      # expect(total).to eq(50)
    end
  end
end

# CalculateTotal(items, new Options())
# CalculateTotal(items, null)
# CalculateTotal(null, null)
# CalculateTotal(empty List, new Options())
