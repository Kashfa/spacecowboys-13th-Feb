require('pg')

class Bounty

  attr_accessor :name, :bounty_value, :homeworld, :species
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @bounty_value = options['bounty_value'].to_i
    @homeworld = options['homeworld']
    @species = options['species']
    @db = PG.connect({dbname: 'cowboys', host: 'localhost'})
  end

  def save()
    #      db = PG.connect({dbname: 'cowboys', host: 'localhost'})
    sql =
    "INSERT INTO bounties(
    name,
    bounty_value,
    homeworld,
    species
  )
  VALUES(
    $1, $2, $3, $4
    );"

    values = [@name, @bounty_value, @homeworld, @species]
    @db.prepare("save", sql)
    @db.exec_prepared("save", values)
    @db.close()

  end

  def update()
    sql = "UPDATE bounties
    SET(
      name,
      bounty_value,
      homeworld,
      species
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5
      ;"

      values = [@name, @bounty_value, @homeworld, @species, @id]
      @db.prepare("update", sql)
      @db.exec_prepared("update", values)
      @db.close()
    end

    def delete()
      sql = "DELETE FROM bounties WHERE id = $1;"
      values = [@id]
      @db.prepare("delete1", sql)
      @db.exec_prepared("delete1", values)
      @db.close()
    end

    def Bounty.find(id)
      db = PG.connect({dbname: 'cowboys', host: 'localhost'})
      id_to_match = id.to_i
      sql = "SELECT * FROM bounties WHERE id = $1;"
      values = [id_to_match]
      db.prepare("find", sql)
      bounty = db.exec_prepared("find", values)[0]
      db.close()
      found_bounty = Bounty.new(bounty)
      return found_bounty

    end

  end # end CLASS
