class Photo < ApplicationRecord
  has_many :photo_taggings
  has_many :tags, through: :photo_taggings, dependent: :destroy

  has_many :photo_categories
  has_many :categories, through: :photo_categories, dependent: :destroy

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


  def all_tags=(titles)
    self.tags = titles.first.split(',').map(&:strip).reject(&:empty?) .map do |title|
      Tag.where(title: title.strip).first_or_create! if title != ' '
    end
  end

  def all_tags
    tags.map(&:title).join(', ')
  end

  def all_categories=(titles)
    self.categories = titles.first.split(',').map(&:strip).reject(&:empty?) .map do |title|
      Category.where(title: title.strip).first_or_create! if title != ' '
    end
  end

  def all_categories
    categories.map(&:title).join(', ')
  end

  def self.tagged_with(title)
    Tag.find_by_title!(title).photos
  end

  def self.categorised_with(title)
    Category.find_by_title!(title).photos
  end
  private

  def delete_featured_image
    self.image = nil
  end
end
