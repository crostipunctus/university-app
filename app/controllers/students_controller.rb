class StudentsController < ApplicationController
  def index 
    @students = Student.all
  end

  def new 
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def create 
    @student = Student.new(student_params) 
    if @student.save 
      flash[:notice] = "Student succesfully created"
      redirect_to @student
    else 
      flash[:alert] = "Student could not be created"
      render :new 
    end
    
  end



  private

  def student_params 
    params.require(:student).permit(:name, :email, :password)
  end
end