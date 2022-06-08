require 'rails_helper'

RSpec.describe "Baskets", type: :request do
  let(:item1) {FactoryBot.create(:item, price: 15, quantity: 2)}
  let(:item2) {FactoryBot.create(:item, price: 20, quantity: 1)}
  let(:item3) {FactoryBot.create(:item, price: 5, quantity: 4)}
  let(:items1) {[item1, item3]}
  let(:items2) {[item1, item2]}

  describe 'GET /baskets' do
    before do
      FactoryBot.create(:basket, items: items1)
      FactoryBot.create(:basket, items: items2)
      FactoryBot.create(:basket)
    end

    it 'returns all baskets' do
      get '/api/v1/baskets'

      # expect(response).to have_http_status(:success)
      # expect(response_body.size).to eq(2)
      # expect(response_body).to eq(
      #   [{
      #     'id' => 1,
      #     'price' => 23,
      #     'quantity' => 2
      #   }, {
      #     'id' => 2,
      #     'price' => 17,
      #     'quantity' => 3
      #   }]
      # )
    end
  end
end
