class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :update_comments_counter
  after_destroy :update_comments_counter

  private

  def update_comments_counter
    post.update(CommentsCounter: post.comments.count)
  end
end
