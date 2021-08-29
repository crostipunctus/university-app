class StudentsController < ApplicationController
  before_action :require_student, except: [:new, :create]
  before_action :require_same_student, only: [:edit, :update, :destroy]
  
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
      session[:student_id] = @student.id
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

  def require_same_student
    @student = Student.find(params[:id])
    if current_student != @student
      flash[:alert] = "You can edit only your own profile"
      redirect_to students_path
    end
  end

  
end