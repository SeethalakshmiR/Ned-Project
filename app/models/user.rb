class User < ApplicationRecord
  after_create :generate_token
  self.table_name = 'j33_users'
  devise :database_authenticatable,:recoverable, :rememberable, :validatable
  enum role:  [:admin, :customer] 

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end
end