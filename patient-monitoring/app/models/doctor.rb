class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :cases
  has_many :patients, through: :cases
  has_many :entries
  # has_many :contributed_cases, through: :entries, class_name: Case
end
