class EntitiesController < ApplicationController
  def show; end

  def index
    @entities = Entity.joins(:groups).where(groups: { id: params[:category_id] })
      .select('entities.*, groups.icon').order(created_at: :desc)
    @totals = Entity.includes(:groups).where(groups: { id: params[:category_id] }).sum(:amout)
  end

  def new
    if user_signed_in?
      @entity = Entity.new
      @group = Group.find(params[:category_id])
      @groups = Group.where(user_id: current_user.id)
      @groups = @groups.map do |grp|
        [grp.name, grp.id]
      end
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      name = params[:entity][:name]
      amout = params[:entity][:amout]
      group_id = params[:entity][:category]

      @entity = current_user.entities.new(name:, amout:)
      group = Group.find_by(id: group_id)
      @entity.groups << group
      if @entity.save
        flash[:success] = 'Transaction created successfully'
        redirect_to user_category_entities_path(user_id: current_user.id, category_id: params[:entity][:category])
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
    params.require(:entity).permit(:name, :amout, :category)
  end
end
