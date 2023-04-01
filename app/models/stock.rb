class Stock < ApplicationRecord
	belongs_to :profile
	validates :ticker, presence: true
	validates :ticker, format: { without: /\s/ }
end
