class EntriesController < ApplicationController
	before_filter :authenticate_user!
	
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
	    #2nd you retrieve the comment thanks to params[:id]
	    @entriy = @case.entries.find(params[:id])

	    respond_to do |format|
	      format.html # show.html.erb
	    end
	  end

	# GET /cases/:case_id/entries/new
  def new
    #1st you retrieve the post thanks to params[:post_id]
    @case = Case.find(params[:case_id])
    #2nd you build a new one
    @entry = @case.entry.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

	# POST /cases/:case_id/entries
  def create
    #1st you retrieve the post thanks to params[:case_id]
	    @case = Case.find(params[:case_id])
	    #2nd you create the comment with arguments in params[:entry]
	    @entry = @case.entries.create(params[:comment])

  end

	def case_params
		params.require(:entry).permit!
	end

	# GET /cases/:case_id/entries/:id/edit
  def edit
    #1st you retrieve the post thanks to params[:post_id]
    @case = Case.find(params[:case_id])
    #2nd you retrieve the comment thanks to params[:id]
    @entry = @case.entries.find(params[:id])
  end

	  # PUT /cases/:case_id/entries/:id
  def update			
    #1st you retrieve the post thanks to params[:post_id]
    @case = Case.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @entry = @case.entries.find(params[:id])
  end

	  # DELETE /cases/:case_id/entries/1
  def destroy
    #1st you retrieve the case thanks to params[:case_id]
    @case = Case.find(params[:case_id])
    #2nd you retrieve the entry thanks to params[:id]
    @entry = @case.entries.find(params[:id])
    @entry.destroy
  end
end
