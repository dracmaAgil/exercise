class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :require_permission, only: :edit

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Post creado satisfactoriamente.'
      redirect_to profile_path
    else
      flash[:notice] = 'Post NO creado.'
      redirect_to profile_path
    end
  end

  def show
    @post
  end

  def edit
    @post
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post actualizado satisfactoriamente.'
      redirect_to profile_path
    else
      flash[:notice] = 'Post NO actualizado.'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Post eliminado satisfactoriamente.'
      redirect_to profile_path
    else
      flash[:notice] = 'Post NO eliminado.'
      redirect_to profile_path
    end
  end

  private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content)
    end

    def require_permission
      if current_user != Post.find(params[:id]).user
        redirect_to profile_path
        
        #Or do something else here
      end
    end

end
