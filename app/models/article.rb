class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments 
  # belongs_to :category
  has_many :images
  # , dependent: :destroy
  
  accepts_nested_attributes_for :images,reject_if: :reject_both_blank, allow_destroy: true

  # validates  :title,  presence: true, length:{maximum: 40}
  # validates :title, presence: true
  # validates :text, presence: true
  # , unless: :image?
  # validates_associated :images
  # mount_uploader :image, ImageUploader

  def reject_both_blank(attributes)
    # if attributes[:id]
    #   attributes.merge!(_destroy: "1") if attributes[:url].blank? and attributes[:flip].blank?
    #   !attributes[:face].blank? and attributes[:flip].blank?
    # else
    #   attributes[:face].blank? and attributes[:flip].blank?
    # end
  end

end
