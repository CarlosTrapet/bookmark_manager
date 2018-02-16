require 'pg'

class DatabaseConnection
  def self.setup(db_name)
    @database = PG.connect dbname: "#{db_name}"
  end

  def self.query(query_string) # returns a PG::Result
    result = @database.exec(query_string)
    # result.values
  end
end
