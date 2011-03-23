module PostsHelper
  def indexdisplay
    content_tag:h1 do
      [ link_to(blog.title,blog_path(blog))].html_safe
    end
    content_tag:p do
      [
      blog.body<br>,
     Created at blog.created_at<br>,
    Last Updated at blog.updated_at<br>,
    link_to(Display, post_path(blog.id)),
    link_to(Edit, edit_post_path(blog.id)),
    link_to(Destroy, post_path(blog.id), :confirm => "Are you sure you want to delete this post?", :method => :delete)
     ].join(' ').html_safe
  end
  end
end
