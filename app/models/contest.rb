class Contest < ActiveRecord::Base
  belongs_to :track
  mount_uploader :image,ImageUploader
  has_many :musics, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :contest_end, presence: true
  validates :voting_end, presence: true

end
