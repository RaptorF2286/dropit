# frozen_string_literal: true

# Controlador de posts
class PostsController < DashboardController
  before_action :set_post, only: [:show]

  def new
    @post = Post.new
  end

  def show
    @post.people << current_user.person unless @post.people.exists? current_user.id
  end

  def create
    @post = Post.new(post_params)
    @post.person_id = current_user.id

    if @post.save
      flash[:success] = '¡Success!'
      redirect_to root_path
      return true
    end
    flash.now[:error] = '¡Error!'
    render 'new'
  end

  private

  def set_post
    @post = Post.find params[:id].to_i
  end

  def post_params
    params.require(:post).permit(
      :short_title, :short_description, :title, :description, :image,
      :color, :location
    )
  end
end
