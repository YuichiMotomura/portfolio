require 'csv'

CSV.foreach('db/prefecture2.csv') do |row|
  Prefecture.create(name: "#{row[0]}", ancestry: "#{row[1]}")
end