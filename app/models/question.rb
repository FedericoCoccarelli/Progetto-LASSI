class Question < ApplicationRecord
	has_many :answers, dependent: :destroy 

	def averageScore
		
		total = 0
		self.answers.each do |r|
			total += r.score
		end
		
		return (total.to_f/self.answers.count.to_f).round(2)
	end 

end
