class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # before_action :set_meta_tags
  #
  # private
  #
  # def set_meta_tags
  #   set_meta_tags(
  #     site: 'Blue Bird Mobile Dessert Bar',
  #     description: 'Premium mobile dessert catering in Boston. Handcrafted desserts, artisan coffee, and unforgettable experiences.',
  #     keywords: 'mobile dessert bar, Boston catering, wedding desserts, coffee cart, private events',
  #     og: {
  #       title: 'Blue Bird Mobile Dessert Bar',
  #       description: 'Premium mobile dessert catering in Boston',
  #       type: 'website',
  #       url: request.original_url,
  #       image: asset_url('hero-camper.jpg')
  #     }
  #   )
  # end
end
