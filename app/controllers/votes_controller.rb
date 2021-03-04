class VotesController < ApplicationController
    def create
      @idea = Idea.find(params[:idea_id])
      @idea.votes.create(user_id: current_user.id)
      @vote = @idea.pre_vote_find(current_user)
      @vote.save
      redirect_to idea_path(@idea, anchor: "vote-#{@vote.id}")
    end

    def destroy
      @vote = Vote.find(params[:id])
      @vote.destroy
      # redirect_to idea_path(@vote.idea)
      redirect_to idea_path(@vote.idea)
    end
end
