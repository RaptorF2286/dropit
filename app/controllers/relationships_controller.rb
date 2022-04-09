# frozen_string_literal: true

# Controlador de posts
class PostsController < DashboardController
  def create
    stop
    # @relationship = Relationship.new(relationship_params)
    # @relationship.follower_id = current_user.id

    # if @relationship.save
    #   flash[:success] = '¡Success!'
    #   redirect_to root_path
    #   return true
    # end
    # flash.now[:error] = '¡Error!'
    # render 'new'
  end

  private

  def relationship_params
    params.require(:relationship).permit(:followed_id)
  end
end
