require './lib/database_connection.rb'

task :setup do
  p 'Setting up databases...'
  conn = PG.connect
  ['bookmark_manager','bookmark_manager_test'].each do |database|
      conn.exec("CREATE DATABASE #{database}")
      DatabaseConnection.setup("#{database}")
      DatabaseConnection.query("CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60));")
    end
end

task :test do
  # DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query("TRUNCATE links RESTART IDENTITY;
  INSERT INTO links (url, title) VALUES ('http://www.facebook.com', 'Facebook');
  INSERT INTO links (url, title) VALUES ('http://www.google.com', 'Google');")
end

task :update do
  p "Updating database..."
  conn = PG.connect
  ['bookmark_manager','bookmark_manager_test'].each do |database|
      DatabaseConnection.setup("#{database}")
      DatabaseConnection.query("DROP TABLE IF EXISTS links;")
      DatabaseConnection.query("CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(20));")
      DatabaseConnection.query("
      INSERT INTO links (url, title) VALUES ('http://www.facebook.com', 'Facebook');
      INSERT INTO links (url, title) VALUES ('http://www.google.com', 'Google');")
    end
end
