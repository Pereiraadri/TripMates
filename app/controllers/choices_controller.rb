class ChoicesController < ApplicationController

  def new
    @poll = Poll.find(params[:poll_id])
    @choice = Choice.new
  end

  def create
    @choice = Choice.new(choice_params)
    @choice.user = current_user
    @choice.poll = Poll.find(params[:poll_id])
    if @choice.save
      redirect_to poll_path(@choice.poll)
    else
      render "polls/show", status: :unprocessable_entity
    end
  end

  private

  def choice_params
    params.require(:choice).permit(:answer)
  end
end
