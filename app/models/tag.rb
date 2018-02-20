class Tag < ApplicationRecord
  has_many :photo_taggings
  has_many :photos, through: :photo_taggings

  def self.counts
    self.select("name, count(photo_taggings.tag_id) as count").joins(:photo_taggings).group("photo_taggings.tag_id")
  end

end
