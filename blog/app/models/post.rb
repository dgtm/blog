class Post < ActiveRecord::Base
  validate :title, :presence=>true
  validate :body, :presence=>true

  scope :show_posts_latest, order("created_at DESC")

  before_save :title_case


  def title_case
    self.title.upcase!
    true
  end
end
