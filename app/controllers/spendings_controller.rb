# app/controllers/spendings_controller.rb
class SpendingsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @group = Group.find(params[:group_id])
    @spendings = @group.spendings.order(created_at: :desc)
    @total = @spendings.map(&:amount).sum
  end

  def new
    @group = Group.find(params[:group_id])
    @spending = Spending.new
  end

  def create
    @group = Group.find(params[:group_id])
    @spending = current_user.spendings.build(spending_params)
    @spending.group = @group

    if @spending.save
      redirect_to group_spendings_path(@group), notice: 'Transaction was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def spending_params
    params.require(:spending).permit(:name, :amount)
  end

  def calculate_total(spendings)
    spendings.sum(:amount)
  end
end
