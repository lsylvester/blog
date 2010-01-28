class ArchivesController < ApplicationController
  def show
    @month = Time.utc(params[:year], params[:month])
    @posts = Post.where(archive_month: @month)
  end
end
