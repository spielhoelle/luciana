class SitemapController < ApplicationController
  respond_to :xml
  def index
    @posts = Post.order("created_at DESC")
  end
end
