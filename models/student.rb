require_relative('../db/sql_runner')


class Student
  attr_accessor :first_name, :last_name, :house, :age
  attr_reader :id

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age']

    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      house,
      age
      )VALUES(
        $1,$2,$3,$4
      )
      RETURNING id
      "
    values = [@first_name, @last_name, @house, @age]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Student.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql, [])
  end

  def update()
    sql = "UPDATE students SET
    (
      first_name,
      last_name,
      house,
      age
    )=(
      $1,$2,$3,$4
    ) WHERE id= $5
    "
    values = [@first_name, @last_name, @house, @age, @id]
    SqlRunner.run(sql, values)
  end

  def Student.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql, [])
    return students.map {|stud| Student.new(stud)}
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Student.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values).first()
    return nil if student == nil
    return Student.new(student)

  end






end #class end
