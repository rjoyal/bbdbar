class Admin::GalleryImagesController < ApplicationController
  layout "admin"
  before_action :require_authentication
  before_action :set_gallery_image, only: [ :show, :edit, :update, :destroy ]

  def index
    @gallery_images = GalleryImage.order(created_at: :desc).page(params[:page])
    @gallery_images = @gallery_images.where(category: params[:category]) if params[:category].present?
  end

  def show
  end

  def new
    @gallery_image = GalleryImage.new
  end

  def create
    @gallery_image = GalleryImage.new(gallery_image_params)

    if @gallery_image.save
      redirect_to admin_gallery_images_path, notice: "Gallery image was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @gallery_image.update(gallery_image_params)
      redirect_to admin_gallery_images_path, notice: "Gallery image was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gallery_image.destroy
    redirect_to admin_gallery_images_path, notice: "Gallery image was successfully deleted."
  end

  private

  def set_gallery_image
    @gallery_image = GalleryImage.find(params[:id])
  end

  def gallery_image_params
    params.require(:gallery_image).permit(:title, :description, :category, :image)
  end
end
