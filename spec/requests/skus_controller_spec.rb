require 'rails_helper'

RSpec.describe SkusController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create(email: "sku_usuario@gmail.com", password: "123456") }
  let(:product) { Product.create(slug: "chinelo-rider", name: "Chinelo Rider", description: "Chinelo Rider tamanho 38", manufacturer: "Rider", active: true) }
  let(:sku) { product.skus.create(code: "2603", name: "Cor preta", stock: 10, price_list: 100, listing_price: 120, product_id: product.id) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { product_id: product.id }

      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { product_id: product.id, id: sku.id }

      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    it "updates the requested sku" do
      new_attribute = { name: "Cor branca" }
      put :update, params: { product_id: product.id, id: sku.id, sku: new_attribute }
      sku.reload

      expect(sku.name).to eq("Cor branca")
    end
  end

  describe "DELETE #destroy" do
    product = Product.create(slug: "chuteira-penalti", name: "Chuteira penalti", description: "Chuteira penalti tamanho 42", manufacturer: "Penalti", active: true)
    sku = product.skus.create(code: "1101", name: "Cor azul marinho", stock: 2, price_list: 200, listing_price: 180, product_id: product.id)

    it "destroys the requested sku" do
      expect {
        delete :destroy, params: { product_id: product.id, id: sku.id }
      }.to change(Sku, :count).by(-1)
    end
  end
end
