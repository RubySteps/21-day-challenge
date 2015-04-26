require 'pg'
conn = PGconn.open(:dbname => 'test')
# res  = conn.exec("CREATE TABLE Persons
#                  (
#                    PersonID int,
#                    LastName varchar(255),
#                    FirstName varchar(255),
#                    Address varchar(255),
#                    City varchar(255)
# )") 
#  puts res
  res = conn.exec("INSERT INTO Persons (PersonID, LastName, FirstName, Address, City) VALUES (1,'Rob','Wilkinson','123 Clay St','Los Angeles')")
  puts res
  res = conn.exec("SELECT * FROM Persons")
  res.each do |r|
    puts r
  end
