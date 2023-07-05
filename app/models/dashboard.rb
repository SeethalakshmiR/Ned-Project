class Dashboard < ApplicationRecord
	require 'csv'

	def self.csv_file
		documents_path = File.expand_path('~/Desktop')
  	csv_path = File.join(documents_path, 'admin_users.csv')
  	csv_file = CSV.read(csv_path, headers: true)
	end
end
