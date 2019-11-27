class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  # , dependent: :destroy
  
  # accepts_nested_attributes_for :images, allow_destroy: true

  # validates  :title,  presence: true, length:{maximum: 40}
  # validates :title, presence: true
  # validates :text, presence: true
  # , unless: :image?
  # validates_associated :images
  # mount_uploader :image, ImageUploader

end
