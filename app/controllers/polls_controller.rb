class PollsController < ApplicationController

  def create
    @poll = Poll.new(poll_params)
    @poll.group = Group.find(params[:group_id])

    if @poll.save
      redirect_to group_path(@poll.group), notice: 'Sondage créé avec succès.'
    else
      render :new, alert: 'Impossible de créer le sondage.'
    end
  end

  def show
    @poll = Poll.find(params[:id])
  end


  private
  def check_prerequisites
    group = Group.find(params[:group_id])
    if params[:poll][:category] == 'hebergement' && !group.prerequisite_polls_completed?
      redirect_to group_path(group), alert: "Les sondages 'dates', 'budget' et 'destination' doivent être complétés avant de créer un sondage pour l'hébergement."
    end
  end

  def poll_params
    params.require(:poll).permit(:title, :category, :state, :group_id)
  end
end
