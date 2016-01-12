class BookmarksController < ApplicationController
    include Pundit

  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def new
  end

  def edit
  end
end
