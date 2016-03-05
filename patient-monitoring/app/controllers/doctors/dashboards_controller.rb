class Doctors::DashboardsController < DoctorsController
	def index
	    @patients = Patient.all
	    if params[:search]
	      @patients = Patient.search(params[:search]).order("created_at DESC")
	    else
	      @patients = Patient.all.order('created_at DESC')
	    end
	  end

end