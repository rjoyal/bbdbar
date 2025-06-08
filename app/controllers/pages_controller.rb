# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def home
    @featured_images = GalleryImage.featured.limit(6)
    @featured_testimonials = Testimonial.featured.limit(3)
    @services = Service.active
  end

  def about
    set_meta_tags title: "About Shauna - Blue Bird Mobile Dessert Bar"
  end

  def services
    @services = Service.active
    set_meta_tags title: "Our Services - Blue Bird Mobile Dessert Bar"
  end

  def gallery
    @images = GalleryImage.all
    @categories = GalleryImage.distinct.pluck(:category).compact
    set_meta_tags title: "Photo Gallery - Blue Bird Mobile Dessert Bar"
  end

  def contact
    set_meta_tags title: "Contact Us - Blue Bird Mobile Dessert Bar"
  end
end
