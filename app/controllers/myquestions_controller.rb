class MyquestionsController < QuestionsController
	def index
		@questions = Question.all
		@questions =  @questions.filter_by_author(current_user.email)
	end
end
