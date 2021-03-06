class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods
  has_many :meals
  has_many :intakes
  accepts_nested_attributes_for :intakes

  def admin?
    role == 'admin'
  end
end
