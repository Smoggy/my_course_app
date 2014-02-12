class Student < ActiveRecord::Base
	belongs_to :group

	validates :name, presence: true, length: { maximum: 50 }
	validates :birth_year,presence: true
	validates :group, presence: true
	
  
end
