class Appointment < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :patient

	# attr_accessible :appointment_time, :patient_id, :doctor_id

	# validates_datetime :appointment_time, on: :create, on_or_after: :today

	 #----------------
  # using the state_machine gem here to control the approval, rescheduling,
	#confirming or cancelling appointments
	States = {
		pending_doctor_approval: 0,
		pending_patient_approval: 1, 
		confirmed: 2,
		cancelled: 3
	}

	state_machine :state, :initial => :pending_doctor_approval do
		States.each do |name, value|
			state name, value: value
		end

		event :doctor_approve do
			transition :pending_doctor_approval => :confirmed
		end

		event :patent_reschedule do
			transition [:confirmed, :pending_doctor_approval] => :confirmed
		end

		event :doctor_reschedule do
			transition [:confirmed, :pending_patient_approval, :pending_doctor_approval] => :pending_patient_approval
		end

		event :patient_approve do
			transition :pending_patient_approval => :confirmed
		end

		event :cancel do
			transition [:pending_doctor_approval, :pending_patient_approval, :confirmed] => :canceled
		end
	end

	def status
		retval = ''
		if pending_doctor_approval?
				retval = 'Pending Doctor approval'
		elsif pending_patient_approval?
			retval = 'Pending Patient approval'
		elsif confirmed?
			retval = 'Confirmed'
		elsif canceled?
				retval = 'Canceled'
		end
		retval
	end

	# scope :not_cancelled, where('state != ?', Appointment::States[:canceled])
	# scope :future, where("appointment_time > ?", Time.now)
	# scope :for_doctor, lambda { |doctor_id| joins(:doctor).where('doctors_id = ?', doctor_id) }
	# scope :for_patient, lambda { |patient_id| joins(:patient).where('patient_id = ?', patient_id) }

	
end
