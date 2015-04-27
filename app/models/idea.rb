class Idea < ActiveRecord::Base
  has_many :idea_images
  has_many :images, :through => :idea_images

  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :category_id, presence: true
end
