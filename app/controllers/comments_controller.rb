# frozen_string_literal: true

# Controlador de comentarios
class CommentsController < DashboardController
  before_action :set_post, only: [:create]

  def create
    comment = Comment.new(comment_params)
    comment.person_id = current_user.id
    @post.comments << comment

    if @post.save
      flash[:success] = '¡Success!'
      redirect_to post_path(@post)
      return true
    end
    flash.now[:error] = '¡Error!'
    render 'new'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :description)
  end
end
