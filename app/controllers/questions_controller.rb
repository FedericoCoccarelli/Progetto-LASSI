class QuestionsController < ApplicationController
  
	def index
  	@questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    authorize! :create, Question, message: "You are not authorized!"
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    authorize! :destroy, Question, message: "You are not authorized!"
      @question = Question.find(params[:id])
      if current_user.email==@question.author||current_user.coolness>=2
        @question.destroy
      end

      redirect_to root_path
  end

  def update
    authorize! :update, Question, message: "You are not authorized!"
      @question = Question.find(params[:id])
      if current_user.email==@question.author
        if @question.update(question_params)
          redirect_to @question
        end
      else
        render :edit
      end
  end

  private
  def question_params
    params.require(:question).permit(:title,:body, :author, :date)
  end

end
