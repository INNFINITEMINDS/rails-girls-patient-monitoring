class CasesController < ApplicationController
	# before_filter :authenticate_user!
	def index
	end

	def new
		@case=Case.new
	end

	def create
		@case=Case.create(case_params)
		@case.user = current_user
		@case.save
		redirect_to cases_path
	end

	def case_params
		params.require(:case).permit!
	end

	def destroy
		@case = Case.find(params[:id])
		@case.destroy
		redirect_to cases_path
	end

	def edit  
	    @case = Case.find(params[:id])
	end

	def update  
	    @case = Case.find(params[:id])
	    if @case.update_attributes(case_params)
	        redirect_to cases_path
	    else
	        render 'edit'
	    end
	end
end