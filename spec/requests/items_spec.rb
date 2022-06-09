require 'rails_helper'

describe 'Items API', type: :request do
  describe 'GET /items' do
    before do
      FactoryBot.create(:item, price: 23, quantity: 2 )
      FactoryBot.create(:item, price: 17, quantity: 3 )
    end

    it 'returns all items' do
      get '/api/v1/items'

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(2)
      expect(response_body).to eq(
        [{
          'id' => 1,
          'price' => 23,
          'quantity' => 2
        }, {
          'id' => 2,
          'price' => 17,
          'quantity' => 3
        }]
      )
    end
  end

  describe 'GET /items/:id' do
    before do
      @item1 = FactoryBot.create(:item, price: 23, quantity: 2)
      @item2 = FactoryBot.create(:item, price: 17, quantity: 3)
    end

    it 'returns a item' do
      get "/api/v1/items/#{@item1.id}"

      expect(response).to have_http_status(:ok)
      expect(response_body).to eq(
        {
          'id' => 1,
          'price' => 23,
          'quantity' => 2
        }
      )
    end
  end

  describe 'POST /items' do
    it 'creates a new item' do
      expect {
        post '/api/v1/items', params: {
          item: { price: 23, quantity: 2 }
        }
      }.to change { Item.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
      expect(response_body).to eq(
        {
          'id' => 1,
          'price' => 23,
          'quantity' => 2
        }
      )
    end
  end
end
