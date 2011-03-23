class Post < ActiveRecord::Base
  validate :title, :presence=>true
  validate :body, :presence=>true

  scope :latest, order("created_at DESC")

  before_save :title_case
  before_create :set_publish_status
  before_update :check_post

  def set_publish_status
  
      self.publish_status = true
     p  "invoked "
     p publish_status
    end

  def title_case
    title.upcase!
    true
  end

  def check_post
    old_post = Post.find(self.id)
    if title != old_post.title && body != old_post.body
      true
    else
      false
    end
  end
end
