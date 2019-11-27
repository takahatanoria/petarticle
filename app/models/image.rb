class Image < ApplicationRecord
  belongs_to :article, optional: true
  mount_uploader :url, ImageUploader

  # validates_presence_of :article

  # validates  :url,  presence: true
  # validates  :article_id,  presence: true
end
