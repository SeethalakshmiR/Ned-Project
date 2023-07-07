class Dashboard < ApplicationRecord
  require 'csv'

  def self.get_admin_details
    documents_path = File.expand_path('~/Desktop')
    csv_path = File.join(documents_path, 'admin_users.csv')
    admin_details = CSV.read(csv_path, headers: true)
  end
end
