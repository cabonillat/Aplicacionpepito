class Client < ActiveRecord::Base

validates :doc_type, :doc, :nombre, :email, presence: true
validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
has_many :sells

after_create :send_menssage

	def send_menssage
		puts "Bienvenido #{self.nombre}, hola"
	end

end
