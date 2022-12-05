# Scope in rails -

class Post < ApplicationRecord
  has_many_attached :photos
  has_rich_text :rich_body
  belongs_to :user
  has_many :postlikes, dependent: :destroy
  scope :published, -> { where(published: true) }
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :date_published, presence: true
end
