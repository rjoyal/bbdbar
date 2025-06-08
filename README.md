# Blue Bird Mobile Dessert Bar (bbdbar)

A modern Rails 8 application for Blue Bird Mobile Dessert Bar - a premium mobile dessert catering business serving the Greater Boston area.

## Project Overview

This application replaces the existing HubSpot CMS website (https://bluebirdmobiledessertbar.com) with a custom Rails solution that provides better performance, SEO, and content management capabilities.

### Business Context
- **Owner**: Shauna (Pastry Chef & Barista)
- **Service Area**: Greater Boston Area
- **Specialty**: Mobile dessert catering with a vintage camper
- **Services**: Mobile dessert bar, indoor coffee cart, private baking classes
- **Focus**: High-quality photos of the stunning vintage camper, testimonials, and seamless booking

## Tech Stack

- **Framework**: Rails 8.0+ with modern defaults
- **Database**: SQLite3 (development), PostgreSQL (production)
- **Asset Pipeline**: Propshaft (Rails 8 default)
- **JavaScript**: Import Maps + Stimulus
- **CSS Framework**: Tailwind CSS
- **Authentication**: Rails 8 built-in authentication
- **Background Jobs**: Solid Queue
- **Caching**: Solid Cache
- **Image Processing**: Active Storage with variants

## Key Requirements

### Content Management
- Photo gallery with categories and featured images
- Service descriptions with pricing information
- Customer testimonials with featured/non-featured status
- Admin interface for content updates (Shauna needs easy content management)

### SEO & Performance
- Search engine optimization for local discovery
- Fast loading times (especially for image-heavy content)
- Mobile-first responsive design
- Structured data for local business

### Integration Requirements
- **HoneyBook CRM**: Contact forms, customer intake, and order forms will be embedded
- **Image Optimization**: Multiple variants for responsive display
- **Social Proof**: Testimonials peppered throughout the site

### Visual Focus
- Showcase the vintage camper with high-quality photos
- Professional presentation of desserts and coffee service
- Gallery modal functionality for detailed photo viewing
- Photo categorization (camper, desserts, events, etc.)

## Application Structure

### Models
```ruby
# Core content models
User              # Admin authentication (email_address, password)
GalleryImage      # Photo gallery (title, description, category, featured, image attachment)
Testimonial       # Customer reviews (name, content, featured)
Service           # Service offerings (name, description, pricing_info, active)
```

### Controllers & Routes
```ruby
# Public routes
root 'pages#home'
get 'about'    => 'pages#about'
get 'services' => 'pages#services' 
get 'gallery'  => 'pages#gallery'
get 'contact'  => 'pages#contact'

# Admin routes (authentication required)
namespace :admin do
  resources :gallery_images, :testimonials, :services
  root 'dashboard#index'
end

# Authentication routes (Rails 8 built-in)
resource :session
resources :passwords
```

### Key Features Implemented

#### Image Management
- Active Storage with multiple variants (thumb: 400x300, gallery: 800x600, hero: 1200x800)
- Lazy loading and responsive images
- Gallery modal with Stimulus controller
- Category-based filtering

#### Authentication & Admin
- Rails 8 built-in authentication
- Simple admin interface for content management
- Secure password handling with has_secure_password

#### Performance Optimizations
- Solid Cache for fast page loads
- Solid Queue for background image processing
- Propshaft for efficient asset delivery
- Modern browser targeting

## Development Setup

```bash
# Clone and setup
git clone [repository-url] bbdbar
cd bbdbar
bundle install

# Database setup
rails db:create
rails db:migrate
rails db:seed

# Start development server
rails server
```

### Default Admin Credentials
- Email: admin@bbdbar.com
- Password: changeme123
- **Important**: Change these credentials before deployment

## Content Structure

### Sample Services (from seeds)
1. **Mobile Dessert Bar**: Vintage camper service (Starting at $500 for 2 hours)
2. **Indoor Coffee & Dessert Cart**: Indoor events (Starting at $300 for 2 hours) 
3. **Private Baking Classes**: Hands-on instruction (Starting at $75 per person)

### Image Categories
- `camper` - Vintage camper exterior/interior shots
- `desserts` - Food photography
- `events` - Action shots from actual events
- `setup` - Behind-the-scenes setup photos
- `portraits` - Photos of Shauna working

## Deployment Considerations

### Recommended Platforms
- **Railway**: Simple Rails deployment with SQLite + Solid suite
- **Fly.io**: Good performance, easy scaling
- **Heroku**: Classic Rails hosting (requires PostgreSQL addon)

### Production Requirements
- Configure proper image storage (AWS S3 or similar)
- Set up SSL certificates
- Configure domain (bbdbar.com)
- Environment variables for sensitive data

## Next Development Priorities

### Phase 1: Core Pages
1. Complete homepage with hero section and service previews
2. About page with Shauna's story and professional photos
3. Services page with detailed descriptions and pricing
4. Gallery page with filtering and modal functionality
5. Contact page with HoneyBook form integration

### Phase 2: Admin Interface
1. Gallery image management (upload, categorize, feature)
2. Testimonial management (add, edit, feature/unfeature)
3. Service management (descriptions, pricing updates)
4. Basic analytics/dashboard

### Phase 3: SEO & Marketing
1. Structured data implementation (LocalBusiness schema)
2. Meta tags optimization for each page
3. Sitemap generation
4. Google Analytics integration
5. Social media Open Graph tags

### Phase 4: Advanced Features
1. Blog/news section for business updates
2. Online booking calendar integration
3. Customer portal for existing clients
4. Email newsletter signup
5. Social media feed integration

## File Organization Notes

### Critical Files
- `app/models/` - Core business logic models
- `app/controllers/pages_controller.rb` - Main site navigation
- `app/controllers/admin/` - Admin interface controllers
- `app/views/shared/` - Navigation and footer partials
- `app/javascript/controllers/` - Stimulus controllers for interactivity
- `config/routes.rb` - URL structure
- `db/seeds.rb` - Sample data for development

### Asset Management
- `app/assets/images/` - Static images (logos, placeholders)
- Active Storage handles user-uploaded images (gallery photos)
- Tailwind CSS provides styling framework
- Stimulus handles JavaScript interactions

## Business Context for Development

### Target Audience
- **Primary**: Engaged couples planning weddings
- **Secondary**: Corporate event planners
- **Tertiary**: Private party hosts, birthday celebrations

### Brand Personality
- Elegant and sophisticated
- Personal and approachable (Shauna's personal brand)
- Quality-focused and artisanal
- Instagram-worthy visual appeal

### Competitive Advantages
- Unique vintage camper creates memorable experiences
- High-quality handcrafted desserts
- Professional coffee service
- Full-service experience (not just food delivery)

This context should provide everything needed to continue development with Claude Code, including technical decisions, business requirements, and implementation priorities.