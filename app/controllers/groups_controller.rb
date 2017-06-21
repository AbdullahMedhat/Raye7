class GroupsController < ApplicationController
  def index
    @groups = Group.all
    render json: @groups
  end

  def update
    @group = Group.find params[:id]
    @group.update! group_params
    render json: @group
  end

  def create
    @group = Group.new group_params
    @group.save!
    render json: @group
  end

  def destroy
    @group = Group.find params[:id]
    @group.destroy!
    render json: @group
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
