class EntitiesController < ApplicationController
  before_action :authenticate_user!
  def show
    @group = Group.find(params[:group_id])
    @entity = Entity.find(params[:id])
  end

  def new
    @entity = Entity.new
    @group = Group.find(params[:group_id])
    @groups = Group.includes(:user).where(user: { id: current_user.id })
  end

  def create
    group_ids = params[:entity][:group_ids]

    if group_ids.nil?
      flash[:alert] = 'Something went wrong'
      redirect_to new_group_entity_path
    else
      group_ids.each do |group_id|
        entitiy = current_user.entities.new(
          name: params[:entity][:name],
          amount: params[:entity][:amount],
          group_id:
        )
        entitiy.save
      end

      flash[:notice] = 'Transaction Created!'
      redirect_to group_path(group_ids.first)
    end
  end

  private

  def params_entity
    params.require(:entity).permit(:author_id, :amount, :name, group_ids: [])
  end
end
