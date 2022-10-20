class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    user.increment!(:posts_counter)
  end
end
