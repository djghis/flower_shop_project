require_relative('../db/sql_runner')

class Stock

  attr_reader(:id, :quantity)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @quantity = options['quantity'].to_i

  end

  def save()
      sql = "INSERT INTO stocks (quantity) VALUES ($1)  RETURNING id"
      values = [@quantity]
          results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end



    def self.all()
      sql = "SELECT * FROM stocks"
      results = SqlRunner.run( sql )
      return results.map { |hash| Stock.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM stocks
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Stock.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM stocks"
      SqlRunner.run( sql )
    end



end
