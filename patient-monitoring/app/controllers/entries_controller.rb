class EntriesController < ApplicationController
	before_filter :authenticate_user!
	# ce trenbuie de facut cu faptul ca un entry poate fi creat doar in existenta cazului?
	def index
	end

	def new
		@entry=Entry.new
	end

	def create
		@entry=Entry.create(case_params)
		@entry.user_id = current_user.id
		# @entry.case_id = current_case.id
		# voprosik:  ce de facut cu current case?

		@entry.save
		redirect_to entries_path
	end

	def case_params
		params.require(:entry).permit!
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
		redirect_to entries_path
	end

	def edit  
	    @entry = Entry.find(params[:id])
	end
end
