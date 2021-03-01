class IdeasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
  end
end
