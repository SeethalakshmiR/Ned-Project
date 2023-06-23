class User < ApplicationRecord
  self.table_name = 'j33_users'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
        
  enum role: { admin: 0, customer: 1 }
end
