class PhotosController < ApplicationController

  before_action :require_user, only: [:show, :edit, :update, :destroy]
  #before_action :require_editor, only: [:show, :edit]
  #before_action :require_admin, only: [:destroy]

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
      if @photo.update(photo_params)
        redirect_to @photo
      else
        render 'edit'
      end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to root_url
  end

  private
  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
