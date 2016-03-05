class Doctors::CasesController < DoctorsController

	before_filter :authenticate_doctor!

	def index
		@cases = Case.all
	end

	def my_cases
		@cases = Case.with_doctor(current_doctor)
		render :index
	end

	def new
		@case = Case.new
		@patient = Patient.find(params[:patient_id])
	end

	def create
		@case=Case.create(case_params)
		@case.doctor = current_doctor
		@case.patient = Patient.find(params[:patient_id])
		@case.save
		redirect_to cases_path
	end


	def show
		@case = Case.find(params[:id])
		@new_entry = Entry.new
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

	private
		def case_params
		params.require(:case).permit!
	end
end