require("pry")
require_relative("./models/student")

Student.delete_all()

student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house' => 'Gryffindor',
  'age' => 11
  })
student1.save()

student2 = Student.new({
  'first_name' => 'Rubeus',
  'last_name' => 'Hagrid',
  'house' => 'Hufflepuff',
  'age' => 37
  })
  student2.save()




binding.pry
nil
