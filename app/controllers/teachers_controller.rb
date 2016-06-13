class TeachersController < ApplicationController
  #list of all teachers
  def index
    @teachers = Teacher.all
  end

end
