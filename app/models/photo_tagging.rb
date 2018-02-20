class PhotoTagging < ActiveRecord::Base
  belongs_to :photo
  belongs_to :tag
end
