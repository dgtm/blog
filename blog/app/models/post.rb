class Post < ActiveRecord::Base

  has_many :comments, :dependent => :destroy

  validates :title, :presence=>true
  validates :body, :presence=>true

  scope :latest, order("created_at DESC")
  scope :order_by_title, order("title ASC")

  #
  # before_save :title_case
  before_create :set_publish_status
  before_update :check_post

  def set_publish_status

    self.publish_status = true
     p  "invoked "
     p publish_status
    end

  # def title_case
  #    self.title.downcase
  #  end

  def check_post
    old_post = Post.find(self.id)
    if title != old_post.title || body != old_post.body
      true
    else
      false
    end
  end


  # def publish
  #   if self.publish_status = false
  #     self.publish_status = true
  #   else
  #     p "The post is already published."
  #   end
  #
  #   def unpublish
  #     if self.publish_status = true
  #       self.publish_status = false
  #     else
  #       p "The post is not published."
  #     end

end
