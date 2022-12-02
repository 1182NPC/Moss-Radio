# Scope in rails -

class Post < ApplicationRecord
  belongs_to :user
  has_many :postlikes, dependent: :destroy
  scope :published, -> { where(published: true) }
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
end
