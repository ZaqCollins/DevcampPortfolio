class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 5, maximum: 1000 }

  after_creat_commit { CommentBroadcastJob.perform_later(self) }
end
