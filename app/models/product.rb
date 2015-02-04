class Product < ActiveRecord::Base
	validates :ref, :price, :quantity, :brand, :name, :description, :size, :color, presence: true

	validates :size, length: {in: 1..3}
	validates :price, numericality: {greater_than: 0}
	validates :ref, uniqueness: true
	validates :ref, format: {with: /\A[0-9A-Z]+\Z/}
	validates :quantity, numericality: { only_integer: true }

has_many :line_items

end
