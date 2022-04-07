# frozen_string_literal: true

# Controlador principal
class PostsController < DashboardController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:success] = '¡Success!'
      redirect_to root_path
      return true
    end
    flash.now[:error] = '¡Error!'
    render 'new'
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
