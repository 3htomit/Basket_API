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

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(3)
    end
  end

  describe 'GET /baskets/:id' do
    before do
      @basket1 = FactoryBot.create(:basket, items: items1)
    end

    it 'returns a basket' do
      get "/api/v1/baskets/#{@basket1.id}"

      expect(response).to have_http_status(:ok)
      expect(response_body).to eq(
        {
          "basket_id" => 1,
          "items" => [
          {
          "item_id" => 1,
          "price" => 15,
          "quantity" => 2
          },
          {
          "item_id" => 2,
          "price" => 5,
          "quantity" => 4
          }
          ],
          "total" => 56.5
        }
      )
    end
  end

  describe 'POST /baskets' do
    it 'creates a new basket' do
      expect {
        post '/api/v1/baskets', params: {
          item_ids: [item1.id, item2.id]
        }
      }.to change { Basket.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
      expect(response_body).to eq(
        {
          "basket_id" => 1,
          "items" => [
          {
          "item_id" => 1,
          "price" => 15,
          "quantity" => 2
          },
          {
          "item_id" => 2,
          "price" => 20,
          "quantity" => 1
          }
          ],
          "total" => 56.5
        }
      )
    end
  end
end
