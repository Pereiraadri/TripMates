class GroupsController < ApplicationController
  before_action :set_group, only: [:show]

  def index
    @groups = Group.all
    #@groups = current_user.groups
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    if @group.save
      redirect_to group_path(@group), notice: "Le groupe a été créé."
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
    @members = @group.users
    @budget_poll = @group.polls.find_by(category: 0)
    @destination_poll = @group.polls.find_by(category: 20)
    @dates_poll = @group.polls.find_by(category: 10)
  end

  def destroy
  end

  def send_invite
    invite_url = group_join_url(@group.invite_token)
    flash[:notice] = "Le lien d'invitation est : #{invite_url}"
    redirect_to group_path(@group)
  end

  def join_by_invite
    @group = Group.find_by(invite_token: params[:invite_token])
    if @group.present?
      UserGroup.create(user: current_user, group: @group)
      redirect_to group_path(@group), notice: "Bienvenue dans le groupe, commence à voter"
    else
      redirect_to root_path, alert: "Aucun groupe avec ce token n'existe"
    end
  end


  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
  params.require(:group).permit(:title, :description, :cover_banner, :category)
  end
end
