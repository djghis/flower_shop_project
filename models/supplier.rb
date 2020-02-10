require_relative('../db/sql_runner')

class Supplier

  attr_reader(:id, :name, :adress, :phone, :email )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @adress = options['adress']
    @phone = options['phone']
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO suppliers
    (
    name,
    adress,
    phone,
    email
    )
    VALUES
    (
    $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @adress, @phone, @email]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE Suppliers SET (name, adress, phone, email) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @adress, @phone, @email, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM suppliers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end


  def self.all()
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run( sql )
    return results.map { |hash| Supplier.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM suppliers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Supplier.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM suppliers"
    SqlRunner.run( sql )
  end



end
