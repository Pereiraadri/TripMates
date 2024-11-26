class ChoicesController < ApplicationController

  def new
    @choice = Choice.new
    @poll = Poll.new
  end

  def create
  end

end
