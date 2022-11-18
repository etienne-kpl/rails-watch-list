class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    # bookmarks_done = Bookmark.all.select { |b| b.list_id == @list }
    # bookmarks_done.map { |b| b = b.movie_id }
    # @movies = Movie.all.reject { |movie| bookmarks_done.include?(movie.id) }
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
      puts 'great job'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = Bookmark.where(list_id: @bookmark)
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
