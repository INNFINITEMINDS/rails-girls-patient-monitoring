class Case < ActiveRecord::Base  
	belongs_to :doctor
	belongs_to :patient
	has_many :entries

	def self.with_doctor(doctor)
		(Case.where(doctor: doctor) + Case.contributed_by(doctor)).uniq
	end

	def self.contributed_by(doctor)
		Case.includes(:entries).where(entries: {doctor_id: doctor.id}).distinct
	end
end