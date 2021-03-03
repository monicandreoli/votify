class IdeasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      sql_query = "address ILIKE :query"
      @ideas = Idea.where(sql_query, query: "%#{params[:query]}%")
    else
      @ideas = Idea.all
    end
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @idea.update(idea_params)
    redirect_to idea_path(@idea)
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :problem, :solution, :address, :photo)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
