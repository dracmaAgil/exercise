class WelcomeController < ApplicationController
  def index
    # @search = Post.all.search(params[:q]).result
    # @search = Post.ransack(params[:q])
    # @search.sorts = 'created_at desc' if @search.sorts.empty?
    # @post = @search.result.paginate(page: params[:page], per_page: 20)
    @posts = Post.all.order('created_at desc')
  end
end
