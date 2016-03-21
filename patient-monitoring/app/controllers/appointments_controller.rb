
class AppointmentsController < ApplicationController

	def index
		# retrieve the the case, thanks to the [:case_id]
		@appointments = Appointment.all
	end

	def new
		@appointment = Appointment.new
	end

	def create
    @appointment = Appointment.new(params[:appointment])
  end

	def appointment_params
		params.require(:appointment).permit!
	end

	def destroy
		@appointment = Appointment.find(params[:id])
		@appointment.destroy
	end

	def edit
		@appointment = Case.find(params[:id])
	end

	def update
		@appointment = Appointment.find(params[:id])
		if @appointment.update_attributes(params[:appointment])

      if current_user == @appointment.patient 
        @appointment.patient_reschedule
      else
        @appointment.doctor_reschedule
      end
    end
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

	def confirm
    @appointment = Appointment.find(params[:id])
    respond_to do |format|

    all_good = false

	    if @appointment.pending_client_approval?
	      if @appointment.client_approve!
	        all_good = true
	      end
	    else
	      if @appointment.stylist_approve!
	        all_good = true
	      end
	    end
	  end
  end

  def cancel
    @appointment = Appointment.find(params[:id])
  end

  private

    def format_date
	    # The datepicker is awesome but it doesn't format the date the way Ruby
	    # wants it so we parse it out and shove it back in the params hash.
	    
	    # logger.debug("DEBUG: the appointment time is: #{params[:appointment][:appointment_time]}")
	    apt = params[:appointment][:appointment_time]
	    params[:appointment][:appointment_time] = DateTime.strptime(apt, "%m/%d/%Y %I:%M %p") unless apt == ''
	  end
end