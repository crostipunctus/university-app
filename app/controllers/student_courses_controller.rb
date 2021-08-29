class StudentCoursesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    unless current_student.courses.include?(course)
      StudentCourse.create(course: course, student: current_student)
      flash[:notice] = "Enrolled successfully in #{course.name}"
      redirect_to current_student
    else  
      flash[:alert] = "Something went wrong"
      redirect_to root_path
    end
  end
end