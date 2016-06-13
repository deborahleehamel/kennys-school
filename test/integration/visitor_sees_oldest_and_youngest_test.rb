require 'test_helper'

  class VisitorCanSeeTeachersTest < ActionDispatch::IntegrationTest
    test "visitor sees teachers list with students" do

      #setup
      #create 3 teachers
      teacher1 = Teacher.create(first_name: "Billy", last_name: "Jeans")
      teacher2 = Teacher.create(first_name: "Hilary", last_name: "Clinton")
      teacher3 = Teacher.create(first_name: "Jill", last_name: "Stein")


      #create students for 3 teachers
      teacher1.students << [Student.create(first_name: "Heidi", last_name: "Jeans", age: 20), Student.create(first_name: "Billy", last_name: "Jeans", age: 30), Student.create(first_name: "Larry", last_name: "Jeans", age: 25), Student.create(first_name: "Bobby", last_name: "Jeans", age: 19)]
      teacher2.students << Student.create(first_name: "Deb", last_name: "Jeans", age: 40)
      teacher3.students << [Student.create(first_name: "Jim", last_name: "Jeans", age: 50), Student.create(first_name: "Allan", last_name: "Jeans", age: 70)]


      #visitor goes to /teachers
      visit '/teachers'
      save_and_open_page

      #teacher's oldest and youngest student age shows on page
      assert page.has_content? "Oldest student: 30"
      assert page.has_content? "Youngest student: 19"
      rassert page.has_no_content? "25"
    end

end
