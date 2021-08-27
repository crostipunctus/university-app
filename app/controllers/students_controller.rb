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
      render :new 
    end
    
  end

  def edit 
    @student = Student.find(params[:id])
  end 

  def update 
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
      flash[:notice] = "Updated succesfully"
    else  
      render :edit 
    end

  end



  private

  def student_params 
    params.require(:student).permit(:name, :email, :password)
  end

  
end