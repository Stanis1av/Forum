class Comment < ApplicationRecord
  belongs_to :article

  validates_presence_of :body, :author, :user_id
end
