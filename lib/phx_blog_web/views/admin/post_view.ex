defmodule PhxBlogWeb.Admin.PostView do
  use PhxBlogWeb, :view

  def relative_date(post) do
    {:ok, relative_str} = Timex.format(post.inserted_at, "{relative}", :relative)
    relative_str
  end
end
