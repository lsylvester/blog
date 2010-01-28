class ArchivesController < ApplicationController
  def show
    @archive = Archive.new(params[:year], params[:month])
    @posts = @archive.posts
  end
end
