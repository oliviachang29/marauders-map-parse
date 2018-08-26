require 'csv'
require 'json'

questions = []

def generate_answers(answers)
	numbers = ["One", "Two", "Three", "Four"]
	correct_ans = answers[0]

	answers.shuffle!

	temp_ans = []
	for i in 0..3
		temp_ans.push(numbers[i] + ". " + answers[i])

		if answers[i] == correct_ans
			correct_ans = numbers[i]
		end
	end

	return [correct_ans, temp_ans]
end

c = 1;
CSV.parse(File.readlines('data.csv').drop(7).join) do |row|
	temp_q = Hash.new
	temp_q['index'] = c
	temp_q['question'] = row[0]
	
	generated_answers = generate_answers([row[1],row[2],row[3],row[4]])
	temp_q['correct_answer'] = generated_answers[0]
	temp_q['answers'] = generated_answers[1]
	
	c = c + 1
	questions.push(temp_q)
end

puts "module.exports = Object.freeze({ questions_en_US: " + JSON.generate(questions) + "});"