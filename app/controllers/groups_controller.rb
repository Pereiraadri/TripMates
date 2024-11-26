class GroupsController < ApplicationController

  def index
    @groups = Group.all

    @groups = @groups.where()
  end

  def create
    @group = Group.new
    @group.user = current_user
    if @group.save
      redirect_to root_path, notice: "Le groupe a été créé."
    else
      flash[:alert] = "Le groupe n'a pas été créé."
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
  end

end
