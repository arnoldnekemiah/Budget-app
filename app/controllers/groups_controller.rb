class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]

  def index
    @groups = Group.all
    # Initialize @totals to an empty array
    @totals = []

    # Assuming you have some logic here to calculate totals, replace this with your actual logic
    @groups.each do |group|
      total_amount = calculate_total_amount_for_group(group)
      @totals << total_amount
    end
  end

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
    @total = @spendings.sum(:amount)
  end

  private

  def set_user
    @user = current_user
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def calculate_total_amount_for_group(group)
    # Replace this line with your logic to calculate the total amount for a group
    group.spendings.sum(:amount)
  end
end
