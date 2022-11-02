class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :update_post_counter
  after_initialize :init_comments
  after_initialize :init_likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def init_comments
    return unless new_record?

    self.CommentsCounter = 0
  end

  def init_likes
    return unless new_record?

    self.LikesCounter = 0
  end

  def update_post_counter
    user.increment!(:posts_counter)
  end
end
