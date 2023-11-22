class SpendingsController < ApplicationController
  before_action :set_group, only: %i[index new create]

  def index
    @group = Group.find(params[:group_id])
    @spendings = @group.spendings.order(created_at: :desc)
    @total = @spendings.map(&:amount).sum
  end

  def new
    @spending = Spending.new
    @group = Group.find(params[:group_id])
  end

  # def create
  #   @spending = @group.spendings.build(spending_params)

  #   if @spending.save
  #     redirect_to group_spendings_path(@group), notice: 'Transaction added successfully.'
  #   else
  #     render :new
  #   end
  # end

  def create
    @spending = Spending.new(spendings_params)
    @group = Group.find(params[:group_id])

    if @spending.save
      SpendingGroup.create(group_id: @group.id, spending_id: @spending.id)
      redirect_to group_spendings_path(@group), notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def spending_params
    params.require(:spending).permit(:name, :amount).merge(author_id: current_user.id)
  end

  def calculate_total(spendings)
    spendings.sum(:amount)
  end
end
