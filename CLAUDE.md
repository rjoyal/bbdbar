# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Rails Commands
- `rails server` - Start development server
- `rails console` - Open Rails console
- `rails db:migrate` - Run database migrations
- `rails db:seed` - Seed database with sample data
- `rails db:reset` - Reset database (drop, create, migrate, seed)
- `rails generate migration <name>` - Create new migration
- `rails test` - Run test suite

### Asset & Frontend Commands
- `rails assets:precompile` - Compile assets for production
- `rails tailwindcss:watch` - Watch and rebuild Tailwind CSS
- `npm install` - Install JavaScript dependencies (Stimulus)

### Code Quality
- `bundle exec rubocop` - Run Ruby linting
- `bundle exec brakeman` - Security vulnerability scanning

## Application Architecture

### Rails 8 Modern Stack
This is a Rails 8 application using modern defaults:
- **Asset Pipeline**: Propshaft (not Sprockets)
- **JavaScript**: Import Maps + Stimulus (no Webpack/Vite)
- **CSS**: Tailwind CSS
- **Background Jobs**: Solid Queue
- **Caching**: Solid Cache
- **Database**: SQLite3 (dev), PostgreSQL (production)
- **Authentication**: Rails 8 built-in (email_address field, not email)

### Core Business Models
- `User` - Admin authentication (uses email_address, not email)
- `GalleryImage` - Photo gallery with Active Storage attachments
- `Testimonial` - Customer reviews with featured flag
- `Service` - Service offerings with pricing info

### Authentication System
Uses Rails 8 built-in authentication:
- `User` model has `email_address` field (not `email`)
- Password authentication via `has_secure_password`
- Session management with `Session` model
- Admin routes protected in `admin/` namespace

### Image Management
- Active Storage for image uploads
- Three variants: thumb (400x300), gallery (800x600), hero (1200x800)
- Gallery modal functionality via Stimulus controller
- Categories: camper, desserts, events, setup, portraits

### Stimulus Controllers
- `gallery_controller.js` - Modal functionality for image viewing
- `mobile_menu_controller.js` - Mobile navigation toggle
- Uses modern import maps (not bundled JavaScript)

### Route Structure
```ruby
# Public pages
root "pages#home"
get "about|services|gallery|contact", to: "pages#<action>"

# Admin interface (requires authentication)
namespace :admin do
  resources :gallery_images, :testimonials, :services
  root 'dashboard#index'
end

# Authentication (Rails 8 built-in)
resource :session
resources :passwords
```

### Database Considerations
- Uses SQLite3 in development (Rails 8 default)
- Solid Queue/Cache tables managed automatically
- Active Storage tables for image attachments
- Seeds file creates admin user: admin@bbdbar.com / changeme123

### Business Context
This is a mobile dessert bar business website featuring:
- Vintage camper mobile service
- Photo-heavy gallery showcasing equipment and food
- Service descriptions with pricing
- Customer testimonials
- Admin interface for content management by business owner (Shauna)

### Key Implementation Notes
- Uses `email_address` field (Rails 8 auth) not `email`
- Image variants created on-demand via Active Storage
- Tailwind for responsive design
- Modern browser requirements enforced
- Eastern Time zone configured