require("pry")
require_relative("./models/student")
require_relative("./models/house")

House.delete_all()
Student.delete_all()



house1 = House.new({
  'name' => 'Gryffindor',
  'url' => 'Sexy_lions.com'
  })
house1.save()

house2 = House.new({
  'name' => 'Hufflepuff',
  'url' => 'Sexy_badgers.com'
  })
house2.save()

house3= House.new({
  'name' => 'Ravenclaw',
  'url' => 'Sexy_Ravens.com'
  })
house3.save()

house4 = House.new({
  'name' => 'Slytherin',
  'url' => 'Sexy_Snakes.com'
  })
house4.save()

student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house' => house1.id,
  'age' => 11
  })
student1.save()

student2 = Student.new({
  'first_name' => 'Rubeus',
  'last_name' => 'Hagrid',
  'house' => house2.id,
  'age' => 37
  })
student2.save()




binding.pry
nil
