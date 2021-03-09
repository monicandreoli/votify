class IdeasController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :approve, :deny]

  def dashboard
    @ideas = Idea.all
    @latest_ideas = Idea.order(:created_at).limit(5)
    @popular_ideas = Idea.most_popular
    # @popular_ideas = Idea.includes(:votes).order("votes DESC")
    @my_ideas = current_user.ideas.order(created_at: :desc)
    @my_voted_ideas = current_user.voted_ideas

    @chatroom = Chatroom.first
    @message = Message.new
  end

  def index
    if user_signed_in?
      @ideas = Idea.geocoded.near(current_user.address, 5, units: :km)
    else
        if params[:query].present?
          @ideas = Idea.geocoded.near(params[:query], 5, units: :km)
        else
          @ideas = Idea.all.geocoded
        end
    end

    @markers = @ideas.map do |idea|
      {
        lat: idea.latitude,
        lng: idea.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { idea: idea })
      }
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

  def approve
    @idea.status = "Approved"
    @idea.save
    respond_to do |format|
      format.js
    end
  end

  def deny
    @idea.status = "Denied"
    @idea.save
    respond_to do |format|
      format.js
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :problem, :solution, :address, :photo, :goal)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
