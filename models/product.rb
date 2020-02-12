require_relative('../db/sql_runner')

class Product

  attr_reader(:id, :name, :description, :supplier_id, :buy_cost, :sell_price, :quantity )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @buy_cost = options['buy_cost'].to_i
    @sell_price = options['sell_price'].to_i
    @supplier_id = options['supplier_id'].to_i
    @quantity = options['quantity'].to_i
  end

  def save()
    sql = "INSERT INTO products
    (
    name,
    description,
    buy_cost,
    sell_price,
    supplier_id,
    quantity
    )
    VALUES
    (
    $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @description, @buy_cost, @sell_price, @supplier_id, @quantity]
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

  def find_supplier_id()
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [@supplier_id]
    supplier = SqlRunner.run(sql, values)[0]
    result = Supplier.new(supplier)
    return result.id
  end

  def self.product_by_supplier(id)
    sql = "SELECT * From products WHERE supplier_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map {|product| Product.new(product)}
  end

  def self.product_by_stock()
    sql = "SELECT * From products WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map {|product| Product.new(product)}
  end

  def markup
    return  @sell_price - @buy_cost
  end


  def sort_alphabet
    @Products = Product.order(:name)
  end


  def sort_by_stock
    @Products = Product.order(:quantity)
  end

  def status
    if @quantity == 0
      return "Out of stock"
    elsif @quantity < 0
      return "ORDER QUICKLY"
    elsif @quantity <= 5
      return "Low in stock"
    else @quantity > 6
        return "Stock OK"
    end
  end

  def status_css
    if @quantity == 0
      return "out-of-stock"
    elsif @quantity < 0
      return "order-quickly"
    elsif @quantity <= 5
      return "low-in-stock"
    else @quantity > 6
        return "stock-OK"
    end
  end



  def update
    sql = "UPDATE products SET (name, description, buy_cost, sell_price, supplier_id, quantity) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @description, @buy_cost, @sell_price, @supplier_id, @quantity, @id]
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
