class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]
  def index
    @tag = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    @tag.save
    redirect_to tags_path(@tag)
  end

  def destroy
    @tag = Tag.find(params[:id]).destroy
    flash.notice = "Tag '#{@tag.name}' Deleted!"
    redirect_to tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    flash.notice = "Tag '#{@tag.name}' Updated!"
    redirect_to tags_path
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
