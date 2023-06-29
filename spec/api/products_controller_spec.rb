require 'rails_helper'

RSpec.describe 'products', type: :request do
  describe 'POST /products' do
    context 'when creating a product' do
      it 'returns success' do
        post '/products', params: { format: 'json', product: { name: 'Pisang Goreng' } }
      end
    end
  end
end
