class Contest < ActiveRecord::Base
  belongs_to :track
  mount_uploader :image,ImageUploader
end
