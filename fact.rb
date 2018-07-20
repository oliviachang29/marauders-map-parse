require 'csv'
require 'json'

facts = []

CSV.parse(File.readlines('data.csv').drop(7).join) do |row|	
	if row[5] != nil
		facts.push(row[5])
	end
end

puts "const data = " + facts.to_s + ";"