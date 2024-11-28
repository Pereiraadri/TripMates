class VotesController < ApplicationController
  def create
    raise
    @choice = Choice.find(params[:choice_id])
    @vote = current_user.votes.build(choice: @choice)

    if @vote.save
      redirect_to poll_path(@choice.poll), notice: "Vote submitted!"
    else
      redirect_to poll_path(@choice.poll), alert: "You have already voted!"
    end
  end
end
