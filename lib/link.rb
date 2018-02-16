require 'pg'
require_relative 'database_connection'

class Link

  @@list = []

  def self.list
    @@list
  end

  def self.all
    query = DatabaseConnection.query('SELECT url FROM links') # assign to variable
    query.map do |row|
      Link.new(row["id"],row["url"])
    end
  end

  def self.add_link(link)
    DatabaseConnection.query("INSERT INTO links (url) VALUES ('#{link}')") if valid?(link)
  end

  def self.valid?(link)
    uri = URI.parse(link)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  end

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end
end
