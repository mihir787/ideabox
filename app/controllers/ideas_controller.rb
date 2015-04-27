class IdeasController < ApplicationController

  def new
    @idea = current_user.ideas.new
  end

  def index
    @ideas = current_user.ideas
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      flash[:message] = "New idea has been added to the IdeaBox!"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
    @idea = current_user.ideas.find(params[:id])
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  def update
    @idea = current_user.ideas.find(params[:id])
    if @idea.update(idea_params)
      flash[:message] = "Your idea has been updated"
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = current_user.ideas.find(params[:id])
    @idea.destroy
    flash[:message] = "Idea has been successfully deleted"
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :user_id)
  end

end
