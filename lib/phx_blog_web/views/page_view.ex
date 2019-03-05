defmodule PhxBlogWeb.PageView do
  use PhxBlogWeb, :view

  def post_excerpt(post) do
    String.slice(post.body, 0..90) <> " ..."
  end
end
