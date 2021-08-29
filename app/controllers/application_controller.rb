class ApplicationController < ActionController::Base

  helper_method :current_student, :logged_in?, :require_student, :enrolled?

  def current_student
    if session[:student_id]
      @current_student ||= Student.find(session[:student_id])
    end
  end

  def logged_in? 
    !!current_student
  end

  def require_student
    if !logged_in?
      flash[:alert] = "You must be logged in to do that"
      redirect_to login_path
    end
  end

  def enrolled?(course_id)
    StudentCourse.where(student_id: current_student.id, course_id: course_id)
  end

  


end
