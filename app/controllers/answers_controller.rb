class AnswersController < ApplicationController


  def edit
    @answer = Question.find(params[:question_id]).answers.find(params[:id])
  end

  def update
    @answer = Question.find(params[:question_id]).answers.find(params[:id])
    
    if @answer.update(answer_params)
      redirect_to @answer.question
    else
      render :edit
    end
  end

  def create
    @question = Question.find(params[:question_id])
    

    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  private
    def answer_params
      p = params.require(:answer).permit(:body, :score, :author)
      {:body=> p[:body], :score=>p[:score], :author=>p[:author]}
    end

end
