class Patients::EntriesController < PatientsController
	 before_filter :authenticate_patient!
	
	def index
		# retrieve the the case, thanks to the [:case_id]
		@case = Case.find(params[:case_id])
		# get all the entries on this case
		@entries = @case.entries
    
	end

	# Get /cases/:case_id/entries/:id
	def show
	    #1st you retrieve the post thanks to params[:post_id]
	    @case = Case.find(params[:case_id])
	    #2nd you retrieve the entry thanks to params[:id]
	    @entry = @case.entries.find(params[:id])

	    respond_to do |format|
	      format.html # show.html.erb
	    end
	  end

	def entry_params
		params.require(:entry).permit!
	end
end
