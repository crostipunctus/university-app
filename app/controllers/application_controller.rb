class ApplicationController < ActionController::Base

  helper_method :current_student, :logged_in? 

  def current_student
    if session[:student_id]
      @current_student ||= Student.find(session[:student_id])
    end
  end

  def logged_in? 
    !!current_student
  end


end
