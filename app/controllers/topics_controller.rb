class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def  create
    @topic = Topic.new(params.require(:topic).permit(:title, :body))
    if @topic.save
      flash[:notice] = "Topic was saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(param.require(:topic).permit(:title, :body))
      flash[:notice] = "Topic was updated."
      redirect_to @topic
    else
      flash[:error] = "Ther was an error saving. Please try again."
      render :edit
    end
  end
end
