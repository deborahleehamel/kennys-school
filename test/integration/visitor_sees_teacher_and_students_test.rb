require 'test_helper'

class VisitorSeesTeacherAndStudentsTest < ActionDispatch::IntegrationTest
  require 'test_helper'

class VisitorCanSeeTeachersTest < ActionDispatch::IntegrationTest
  test "visitor sees teachers list with students" do

    #setup
    #create 3 teachers
    teacher1 = Teacher.create(first_name: "Billy", last_name: "Jeans")
    teacher2 = Teacher.create(first_name: "Hilary", last_name: "Clinton")
    teacher3 = Teacher.create(first_name: "Jill", last_name: "Stein")


    #create students for 3 teachers
    teacher1.students << [Student.create(first_name: "Heidi", last_name: "Jeans"), Student.create(first_name: "Billy", last_name: "Jeans")]
    teacher2.students << Student.create(first_name: "Deb", last_name: "Jeans")
    teacher3.students << [Student.create(first_name: "Jim", last_name: "Jeans"), Student.create(first_name: "Allan", last_name: "Jeans")]


    #visitor goes to /teachers
    visit '/teachers'

    #teacher names display on page
    assert page.has_content? teacher1.first_name
    assert page.has_content? teacher1.last_name
    assert page.has_content? teacher2.first_name
    assert page.has_content? teacher2.last_name
    assert page.has_content? teacher3.first_name

    #all teacher's students display on page
    Teacher.all.each do |teacher|
      teacher.students.all.each do |student|
        assert page.has_content? student.first_name
        assert page.has_content? student.last_name
      end
    end
  end
end
end
