module StateMachineExt

	States = {
		pending_doctor_approval: 0,
		pending_patient_approval: 1,
		confirmed: 2, 
		canceled: 3
	}

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

end
