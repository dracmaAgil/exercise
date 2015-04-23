class WelcomeController < ApplicationController
  def index
    @posts = Post.all.search(params[:q]).result
  end
end
