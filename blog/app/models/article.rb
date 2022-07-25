class Article < ApplicationRecord
	include Visible
  
	has_many :comments, dependent: :destroy
  
	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 10 }
	after_validation :titling_body
  end

  private
  	def titling_body
		self.body = body.titleize
  	end
  