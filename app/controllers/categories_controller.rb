class CategoriesController < ApplicationController
  def index
    if user_signed_in?
      @totals = Group.where(user: current_user.id).includes(:entities).sum(:amout)
      @groups = Group.where(user: current_user.id).includes(:entities).all
    else
      redirect_to new_user_session_path
    end
  end

  def new
    if user_signed_in?
      @group = Group.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @group = current_user.groups.build(group_params)
      if @group.save
        flash[:success] = 'Group created successfully'
        redirect_to user_categories_path(user_id: current_user.id)
      else
        flash[:error] = @group.errors.full_messages
        render :new
      end
    else
      redirect_to new_user_session_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
