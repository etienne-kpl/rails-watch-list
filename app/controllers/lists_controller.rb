class ListsController < ApplicationController
  def index
    @lists = List.all
    @bookmarks = Bookmark.where(list_id: @list)
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
