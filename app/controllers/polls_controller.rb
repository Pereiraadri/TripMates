require "nokogiri"
require "open-uri"

class PollsController < ApplicationController
  before_action :set_poll, only: %i[show]

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
    @choice = Choice.new
    if @poll.nil? || @poll.group.nil?
      redirect_to root_path, alert: "sondage introuvable"
    end
  end

  private

  # Filtrage des paramètres du sondage
  def poll_params
    params.require(:poll).permit(:title, :category, :state, :group_id)
  end

  def set_poll
    @poll = Poll.find_by(id: params[:id])
    redirect_to root_path, alert: "Sondage introuvable." if @poll.nil?
  end
end
