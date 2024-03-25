class Product < ApplicationRecord
  has_many :skus, dependent: :destroy
  accepts_nested_attributes_for :skus

  validates :slug, :name, :description, :manufacturer, :active, presence: true
end
