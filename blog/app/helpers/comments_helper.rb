module CommentsHelper
  def comment_display(comment)
    content_tag :p do
    [

    comment.comment_text,
    comment.created_at,
    "<br />",
    ].join(' ').html_safe
    end
  end
end