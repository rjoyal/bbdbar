# db/seeds.rb (corrected)

# Create admin user - Rails 8 authentication uses email_address, not email
admin = User.create!(
  email_address: "admin@bbdbar.com",
  password: "changeme123",
  password_confirmation: "changeme123"
)

# Create sample services
services = [
  {
    name: "Mobile Dessert Bar",
    description: "Our signature vintage camper brings handcrafted desserts and artisan coffee to your outdoor event.",
    pricing_info: "Starting at $500 for 2 hours",
    active: true
  },
  {
    name: "Indoor Coffee & Dessert Cart",
    description: "Elegant indoor service with the same amazing drinks and pastries.",
    pricing_info: "Starting at $300 for 2 hours",
    active: true
  },
  {
    name: "Private Baking Classes",
    description: "Learn to create beautiful desserts with hands-on instruction.",
    pricing_info: "Starting at $75 per person",
    active: true
  }
]

services.each { |service| Service.create!(service) }

# Sample testimonials
testimonials = [
  {
    name: "Sarah & Mike",
    content: "The Blue Bird camper was the perfect addition to our wedding! Shauna's desserts were absolutely divine.",
    featured: true
  },
  {
    name: "Jennifer L.",
    content: "Our corporate event was elevated by the beautiful presentation and delicious coffee.",
    featured: true
  }
]

testimonials.each { |testimonial| Testimonial.create!(testimonial) }

puts "Seeded #{User.count} users, #{Service.count} services, and #{Testimonial.count} testimonials"
