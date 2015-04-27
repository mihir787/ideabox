class PicturesController < ApplicationController

  def new
    @idea = current_user.ideas.find(params[:idea_id])
  end
end
