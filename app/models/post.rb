# Scope in rails -

class Post < ApplicationRecord
  belongs_to :user
  has_many :postlikes, dependent: :destroy
  scope :published, -> { where(published: true) }
end
