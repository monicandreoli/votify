class VotesController < ApplicationController
    def create
      @idea = Idea.find(params[:idea_id])
      @idea.votes.create(user_id: current_user.id)
      redirect_to idea_path(@idea)
    end

    def destroy
      @vote = Vote.find(params[:id])
      @vote.destroy
      redirect_to idea_path(@vote.idea)
    end
end
