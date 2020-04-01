require_relative('../db/sql_runner')


class House
  attr_accessor :name, :url
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @url = options['url']

    @id = options['id'].to_i if options['id']
  end


  def save()
    sql = "INSERT INTO houses
    (
      name,
      url
      )VALUES(
        $1,$2
      )
      RETURNING id
      "
    values = [@name, @url]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end


  def House.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql, [])
  end

  def House.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql, [])
    return houses.map {|house| House.new(house)}
  end


  def House.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values).first()
    return nil if house == nil
    return House.new(house)
  end


end
