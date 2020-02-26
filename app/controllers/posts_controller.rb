class PostsController < ApplicationController


  def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

     if (@post.save)
      redirect_to @post
    else
      render 'new'
     end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if (@post.update(post_params))
      redirect_to @post
     else
      render 'edit'
     end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path(@post)
  end

  def search
    @post = Post.find(params[:id])

    render 'new'
  end

  private

  def post_params
    params.require(:posts).permit(:title, :body)
  end
end
