class SessionsController < ApplicationController
  def new
    
  end

  def create 
    student = Student.find_by(email: params[:session][:email])

    if student && student.authenticate(params[:session][:password])
      session[:student_id] = student.id
      flash[:notice] = "Logged in succesfully"
      redirect_to student
    else  
      flash.now[:alert] = "Invalid username or password"
      render :new
    end
  end

  def destroy 
    session[:student_id] = nil 
    flash[:notice] = "Logged out successfully"
    redirect_to courses_path
  end

  
end