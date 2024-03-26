require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { Product.create(slug: "camiseta-homem-de-ferro", name: "Camiseta da marvel homem de ferro", description: "Camiseta do homem de ferro, na guerra infinita", manufacturer: "Marvel", active: true) }

  it "when attributes is valid" do
    expect(product).to be_valid
  end

  it "when doesnt slug exists" do
    product = Product.new(
      name: "Camiseta do Mario Bros",
      description: "Camiseta do filme do Mario Bros",
      manufacturer: "Nintendo",
      active: true
    )

    expect(product).to_not be_valid
  end

  it "when product has many skus" do
    product.skus.build(code: "001", name: "carteira de couro", stock: 3, price_list: 200, listing_price: 150)
    product.skus.build(code: "002", name: "meia furada", stock: 2, price_list: 10, listing_price: 5)

    expect(product.skus.length).to eq(2)
  end
end
