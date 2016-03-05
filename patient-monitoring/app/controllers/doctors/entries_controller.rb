class Doctors::EntriesController < DoctorsController
	before_filter :authenticate_doctor!
	
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

	# GET /cases/:case_id/entries/new
  def new
    #1st you retrieve the post thanks to params[:post_id]
    @case = Case.find(params[:case_id])
    #2nd you build a new one
    @entry = Entry.new

  end

	# POST /cases/:case_id/entries
  def create
    #1st you retrieve the post thanks to params[:case_id]
	    @case = Case.find(params[:case_id])
	    #2nd you create the entry with arguments in params[:entry]
	    @entry = @case.entries.build(entry_params)
	    @entry.doctor = current_doctor
	    @case.save!
	    redirect_to @case
  end

	def entry_params
		params.require(:entry).permit!
	end
end
