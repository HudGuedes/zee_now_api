require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create(email: "usuario01@gmail.com", password: "123456") }
  let(:product) { Product.create(slug: "camisa-marrom", name: "Camiseta marrom", description: "camiseta marrom", manufacturer: "Marisa", active: true) }

  before do 
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index

      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: product.id }

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new product" do
      product_params = { slug: "short-jeans", name: "Short Jeans", description: "Short Jeans", manufacturer: "Renner", active: true }
      expect {
        post :create, params: { product: product_params }
      }.to change(Product, :count).by(1)
    end
  end

  describe "PUT #update" do
    it "updates the requested product" do
      new_attributes = { name: "Camiseta branca" }
      put :update, params: { id: product.id, product: new_attributes }
      product.reload

      expect(product.name).to eq("Camiseta branca")
    end
  end

  describe "DELETE #destroy" do
    product = Product.create(slug: "saia-azul", name: "Saia azul", description: "Saia azul", manufacturer: "C&A", active: true)

    it "destroys the requested product" do
      expect {
        delete :destroy, params: { id: product.id }
      }.to change(Product, :count).by(-1)
    end
  end
end
