class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :keywords
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

end
