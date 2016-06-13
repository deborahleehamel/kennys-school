class Teacher < ActiveRecord::Base
  has_many :students

  def oldest_student
    students.maximum(:age)
  end

  def youngest_student
    students.minimum(:age)
  end
end
