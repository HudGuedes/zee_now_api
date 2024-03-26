require 'rails_helper'

RSpec.describe Sku, type: :model do
  let(:product) { Product.create(slug: "toca-homem-aranha", name: "Toca do homem aranha", description: "Toca do homem aranha", manufacturer: "Marvel", active: true) }
  let(:sku) { Sku.create(product_id: product.id, code: "003", name: "oculos preto", stock: 1, price_list: 120, listing_price: 99) }

  it "when attributes is valid" do
    expect(sku).to be_valid
  end

  it "when sku belongs a product" do
    expect(sku.product).to eq(product)
  end
end
