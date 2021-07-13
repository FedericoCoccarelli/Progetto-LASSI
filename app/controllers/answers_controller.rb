class AnswersController < ApplicationController

  def index
    @answers = Answer.all
    @answers =  @answers.filter_by_author(current_user.email)
  end

  def edit
    @answer = Question.find(params[:question_id]).answers.find(params[:id])
  end

   def update
    authorize! :update, Answer, message: "You are not authorized!"
    @answer = Question.find(params[:question_id]).answers.find(params[:id])
    if current_user.email==@answer.author
      if @answer.update(answer_params)
        redirect_to @answer.question
      end
    else
      render :edit
    end
  end


  def create
    authorize! :create, Answer, message: "You are not authorized!"
    @question = Question.find(params[:question_id])
    

    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def destroy
    authorize! :destroy, Answer, message: "You are not authorized!"
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if current_user.email==@question.author||current_user.coolness>=2
        @answer.destroy
      end
    redirect_to question_path(@question)
  end

  private
    def answer_params
      p = params.require(:answer).permit(:body, :author)
      {:body=> p[:body], :author=>p[:author]}
    end

end
