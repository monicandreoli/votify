class VotesController < ApplicationController
  def create
    @idea = Idea.find(params[:idea_id])
    @idea.votes.create(user_id: current_user.id)
    @vote = @idea.pre_vote_find(current_user)
    @vote.save
    respond_to do |format|
      format.js
      format.html { redirect_to idea_path(@idea, anchor: "vote-#{@vote.id}")
    }
  end
end

def update
  @vote = Vote.find(params[:id])
  @idea = @vote.idea
  @vote.update(vote_params)
  redirect_to idea_path(@vote.idea)
end

def destroy
  @vote = Vote.find(params[:id])
  @vote.destroy
  # redirect_to idea_path(@vote.idea)
  redirect_to idea_path(@vote.idea)
end

private

def vote_params
  params.require(:vote).permit(:comment)
end
end
