class LineItem < ActiveRecord::Base
	validates :quantity, presence: true
	validates :quantity, numericality: {greater_or_equal_than: 0}
	validate :validate_stock

	belongs_to :product
	belongs_to :sell

	before_create :init_value
	after_create :update_stock

	after_destroy :add_stock

	def init_value
		self.value = self.quantity * self.product.price
	end

	def update_stock
		self.product.update_attribute(:quantity, self.product.quantity - self.quantity)
	end

	def validate_stock
		if self.quantity > self.product.quantity
			errors.add(:quantity, "No hay stock suficiente")

		end
	end

	def add_stock
		self.product.update_attribute(:quantity, self.product.quantity + self.quantity)
	end



end
