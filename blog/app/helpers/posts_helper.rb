module PostsHelper
  def index_display(blog)
    final_html = "<div id='post-body'>"
    final_html += content_tag :div do
      [ "<div class='post-topic'",
        link_to(blog.title,post_path(blog.id)),
        "</div>"
        ].join(' ').html_safe
    end


   final_html += content_tag :div do
      [
        "<div class='post-details'",
        "<br/><span class='post-details-text'>Created</span>",
        time_ago_in_words(blog.created_at),
        " ago<br/>",
        "<span class='post-details-text'>Updated</span>",
        time_ago_in_words(blog.updated_at),
         " ago<br/>",
        "<span class='post-details-text'>Total Comments:</span>",
        blog.comments.length,
        "</div><div id='post-links'>",
        link_to("Display |", post_path(blog.id)),
        link_to("Edit |", edit_post_path(blog.id)),
        link_to("Destroy", post_path(blog.id), :confirm => "Are you sure you want to delete this post?", :method => :delete),
        "</div></div>"
        ].join(' ').html_safe
    end
    return final_html.html_safe
  end

end
