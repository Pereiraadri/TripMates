class GroupsController < ApplicationController

  def index
  end

  def create
  end

  def new
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
  end

end
