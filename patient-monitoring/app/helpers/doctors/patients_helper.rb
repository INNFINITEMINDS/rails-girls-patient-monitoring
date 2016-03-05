module Doctors::PatientsHelper
	# Returns the gravatar for the given patient
	def gravatar_for(patient)
		gravatar_id = Digest::MD5::hexdigest(patient.email.downcase)
	    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}"
	    image_tag(gravatar_url, alt: patient.email, class: "gravatar")
	    
	end
end