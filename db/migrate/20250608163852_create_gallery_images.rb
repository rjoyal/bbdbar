class CreateGalleryImages < ActiveRecord::Migration[8.0]
  def change
    create_table :gallery_images do |t|
      t.string :title
      t.text :description
      t.string :category
      t.boolean :featured

      t.timestamps
    end
  end
end
