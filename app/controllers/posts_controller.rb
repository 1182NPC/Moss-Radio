class PostsController < ApplicationController
  def index
    @posts = Post.published
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, otice: "Post was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @article, notice: 'Article was successfully updated'
    else
      render :edit
    # raise
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to dashboard_path, notice: "Post was sucessfully destroyed"
  end

  def publish
    @post = Post.find(params[:post_id])
    @post.toggle(:published)
    @post.save
    redirect_to edit_post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :date_published, :rich_body, photos: [])
  end
end
