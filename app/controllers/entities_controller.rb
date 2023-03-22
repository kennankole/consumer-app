class EntitiesController < ApplicationController
  def show; end

  def index
    @totals = Entity.where(user: current_user.id).sum(:amout)
    @entities = Entity.where(user: current_user.id).order(created_at: :desc)
  end

  def new
    if user_signed_in?
      @entity = Entity.new
      @groups = Group.where(user: current_user.id)
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @entity = current_user.entities.build(entity_params)
      if @entity.save
        flash[:success] = 'Transaction created successfully'
        redirect_to user_entities_path(user_id: current_user.id)
      else
        flash[:error] = 'The transaction could not be created'
        puts @entity.errors.full_messages
        render :new
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy; end

  private

  def entity_params
    params.require(:entity).permit(:amout, :name, :group)
  end
end
