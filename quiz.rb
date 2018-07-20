require 'csv'
require 'json'

questions = []


CSV.parse(File.readlines('data.csv').drop(7).join) do |row|
	temp_q = Hash.new
	temp_q[row[0]] = [row[1],row[2],row[3],row[4]]
	questions.push(temp_q)
end

puts "module.exports = {QUESTIONS_EN_US:" + JSON.generate(questions) + "};"