class Admin::DashboardController < ApplicationController
  before_action :require_authentication

  def index
    @gallery_images_count = GalleryImage.count
    @testimonials_count = Testimonial.count
    @services_count = Service.count
    @featured_testimonials_count = Testimonial.where(featured: true).count
    
    @recent_gallery_images = GalleryImage.order(created_at: :desc).limit(5)
    @recent_testimonials = Testimonial.order(created_at: :desc).limit(5)
  end
end