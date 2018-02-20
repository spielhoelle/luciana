class Photo < ApplicationRecord
  has_attached_file :image,
                    default_url: 'header.jpg',
                    styles: {
                      thumbnail: '400x300^',
                      original: '1060x759^'
                    },
                    convert_options: {
                      original: '-quality 75 -strip'
                    }

  validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }

  attr_accessor :remove_featured_image

  before_save :delete_featured_image, if: -> { remove_featured_image == '1' && !image_updated_at_changed? }

  private

  def delete_featured_image
    self.image = nil
  end

end
