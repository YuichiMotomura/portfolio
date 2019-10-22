require 'csv'

CSV.foreach('db/prefecture.csv') do |row|
  Prefecture.create(name: "#{row[0]}")
end