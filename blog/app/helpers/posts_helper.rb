module PostsHelper
  def index_display(blog)
    final_html = ""
    final_html += content_tag :h1 do
      [ link_to(blog.title,post_path(blog.id))].join(' ').html_safe
    end


   final_html += content_tag :p do
      [
        "Blog content:",
        blog.body,
        "<br/>Created at:",
        blog.created_at,
        "<br/>",
        "Last Updated at:",
        blog.updated_at,
        link_to("Display", post_path(blog.id)),
        link_to("Edit", edit_post_path(blog.id)),
        link_to("Destroy", post_path(blog.id), :confirm => "Are you sure you want to delete this post?", :method => :delete)
        ].join(' ').html_safe
    end
    return final_html.html_safe
  end
end
