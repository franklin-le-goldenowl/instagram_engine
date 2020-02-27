class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def index
    # @posts = Post.all
    @pagy, @posts = pagy(Post.all, items: 2)

    @search = params['search']

    return nil unless @search.present?

    @caption = @search['caption']
    @pagy, @posts = pagy(Post.where(caption: @caption), items: 2)
  end

  # action create
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      flash[:alert] = 'Successfully to create post'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Fail to create post'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Fail to update post'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(
      :image,
      :caption
    )
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
