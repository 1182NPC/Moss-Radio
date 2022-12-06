class PostlikesController < ApplicationController
  before_action :find_post
  skip_forgery_protection

  def create
    @postlike = @post.postlikes.create(user_id: current_user.id)
    render json: {
      likes: @post.postlikes.count
    }, status: 200
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
