class Question < ApplicationRecord
	has_many :answers, dependent: :destroy 
	scope :filter_by_author, -> (author) {where author: author}

	def averageScore
		
		total = 0
		self.answers.each do |r|
			total += r.score
		end
		
		return (total.to_f/self.answers.count.to_f).round(2)
	end 

end
