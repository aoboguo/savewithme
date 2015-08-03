class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # def email_required?
  # 	false
  # end

  # def email_changed?
  # 	false
  # end

  validates :username, :phone_number, uniqueness: true

  has_many :portions
  has_many :listings, through: :portions
end
