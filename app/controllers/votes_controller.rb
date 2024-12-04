class VotesController < ApplicationController
  def create
    @choice = Choice.find_by(id: vote_params[:choice_id])

    redirect_to root_path, alert: "Choix introuvable!" and return if @choice.nil?

    @vote = current_user.votes.build(choice: @choice)

    if @vote.save
      redirect_to group_path(@choice.poll.group), notice: "A voté!"
    else
      redirect_to group_path(@choice.poll.group), alert: "Tu as déja voté!"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:choice_id)
  end
end
