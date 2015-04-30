class Contest < ActiveRecord::Base
  belongs_to :track
  mount_uploader :image,ImageUploader
  has_many :musics
end
