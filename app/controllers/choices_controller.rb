class ChoicesController < ApplicationController

  def new
    @poll = Poll.find(params[:poll_id])
    @choice = Choice.new
  end

  def create

  end

end
