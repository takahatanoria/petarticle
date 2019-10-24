class Article < ApplicationRecord
  belongs_to :user



  validates :text, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

end
