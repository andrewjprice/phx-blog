defmodule PhxBlogWeb.PageView do
  use PhxBlogWeb, :view

  def post_excerpt(post) do
    String.slice(post.body, 0..90) <> " ..."
  end

  def markdown(body) do
    body
    |> Earmark.as_html!
    |> raw
  end
end
