class QuestiongoersController < ApplicationController

  def index
  	 @mvgs = Questiongoer.all
  end

  def show
    @mvg = Questiongoer.find(params[:id])
  end

  def new
  	@mvg = Questiongoer.new
  end

  def create
  	@mvg = Questiongoer.new(mvg_params)
  	if @mvg.save
      redirect_to @mvg
    else
      render :new
    end
  end

 def edit
    @mvg = Questiongoer.find(params[:id])
  end

def destroy
    @mvg = Questiongoer.find(params[:id])
    @mvg.destroy

    redirect_to root_path
  end

 def update
    @mvg = Questiongoer.find(params[:id])
    if @mvg.update(mvg_params)
      redirect_to @mvg
    else
      render :edit
    end
  end

	private
    def mvg_params
      params.require(:questiongoer).permit(:name)
    end


end
