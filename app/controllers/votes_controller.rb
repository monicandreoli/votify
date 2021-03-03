class VotesController < ApplicationController
    before_action :find_idea
    before_action :find_vote, only: [:destroy]

    def create
        @idea.votes.create(user_id: current_user.id)
        redirect_to idea_path(@idea)
    end

    def destroy
    # user cannot unvote if didn't vote already
        if !(already_voted?)
          flash[:notice] = "Cannot unvote"
        else
          @vote.destroy
        end
        redirect_to idea_path(@idea)
    end

    private

    def find_idea
        @idea = Idea.find(params[:idea_id])
    end

    def find_vote
        @vote = @idea.votes.find(params[:id])
    end

    def already_voted?
      Vote.where(user_id: current_user.id, idea_id:
      params[:idea_id]).exists?
    end
end
