class Patients::CasesController < PatientsController

	before_filter :authenticate_patient!
	def index
		@cases = Case.where(:patient_id => current_patient.id)
	end

	def show
		@case = Case.find(params[:id])
	end

	# def destroy
	# 	@case = Case.find(params[:id])
	# 	@case.destroy
	# 	redirect_to cases_path
	# end

	# def edit  
	#     @case = Case.find(params[:id])
	# end

	# def update  
	#     @case = Case.find(params[:id])
	#     if @case.update_attributes(case_params)
	#         redirect_to cases_path
	#     else
	#         render 'edit'
	#     end
	# end

	private
		def case_params
		params.require(:case).permit!
	end
end