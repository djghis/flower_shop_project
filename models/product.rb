require_relative('../db/sql_runner')

class Product

  attr_reader(:id, :name, :description, :supplier_id, :buy_cost, :sell_price )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @buy_cost = options['buy_cost'].to_i
    @sell_price = options['sell_price'].to_i
  end

  def save()
    sql = "INSERT INTO products
    (
    name,
    description,
    buy_cost,
    sell_price
    )
    VALUES
    (
    $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @description, @buy_cost, @sell_price]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def find_supplier()
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [@supplier_id]
    supplier = SqlRunner.run(sql, values)[0]
    result = Supplier.new(supplier)
    return result.name
  end

  # def supplier()
  #   supplier = Supplier.find(@supplier_id)
  #   return supplier
  # end



  def update
    sql = "UPDATE products SET (name, description, buy_cost, sell_price) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @description, @buy_cost, @sell_price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM products
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end


  def self.all()
    sql = "SELECT * FROM products"
    results = SqlRunner.run( sql )
    return results.map { |hash| Product.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Product.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run( sql )
  end



end
