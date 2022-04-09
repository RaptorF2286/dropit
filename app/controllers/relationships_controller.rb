# frozen_string_literal: true

# Controlador de posts
class RelationshipsController < DashboardController
  def create
    @relationship = Relationship.new(relationship_params)
    @relationship.follower_id = current_user.id

    if @relationship.save
      flash[:success] = '¡Success!'
      redirect_to people_path
      return true
    end
    flash.now[:error] = '¡Error!'
    render :back
  end

  def destroy
    relationship = Relationship.find_by({ follower_id: current_user.id, followed_id: params[:id] })
    relationship.destroy
    flash[:success] = '¡Success!'
    redirect_to people_path
  end

  private

  def relationship_params
    { follower_id: params[:id], followed_id: params[:followed_id] }
  end
end
