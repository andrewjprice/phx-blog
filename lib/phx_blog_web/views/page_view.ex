defmodule PhxBlogWeb.PageView do
  use PhxBlogWeb, :view

  def post_excerpt(post) do
    String.slice(post.body, 0..200) <> " ..."
    |> Earmark.as_html!
    |> raw
  end

  def markdown(body) do
    body
    |> Earmark.as_html!
    |> raw
  end

  def relative_date(post) do
    {:ok, relative_str} = Timex.format(post.inserted_at, "{relative}", :relative)
    relative_str
  end
end
