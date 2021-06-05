class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :body, :author, :user_id
end
