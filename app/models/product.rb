class Product < ActiveRecord::Base
	belongs_to :category 
	
	validates_presence_of :name, :price, :category_id, :description
	validates_numericality_of :price, :category_id, greater_than_or_equal_to: 1


	def details
		"#{self.name} - #{self.description} - #{self.price}"
	end
end
