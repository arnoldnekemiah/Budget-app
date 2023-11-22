class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]

  def index; end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Category added successfully.'
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    # Load spendings related to this group
    @spendings = @group.spendings.order(created_at: :desc)
    # Check if the group has its own icon; if not, use the current user's avatar
    @group_icon = @group.icon.present? ? @group.icon : current_user.avatar
  end

  private

  def set_user
    @user = current_user
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def calculate_totals(groups); end
end
