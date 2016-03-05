class Doctors::PatientsController < DoctorsController
  def index
    @patients = Patient.search(params[:search])
    @patients_display = Patient.all.order('id DESC')
  end

  def show
    @patient = Patient.find(params[:id])
    # get all the cases on this patient
    # @cases = @patient.cases
    @new_case = Case.new
  end

  

end
