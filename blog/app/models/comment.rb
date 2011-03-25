class Comment < ActiveRecord::Base
  validates  :comment_text, :presence=>true
  belongs_to :post
end
