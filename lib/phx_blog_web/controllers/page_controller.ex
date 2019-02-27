defmodule PhxBlogWeb.PageController do
  use PhxBlogWeb, :controller

  alias PhxBlog.Blog

  def index(conn, _params) do
    posts = Blog.list_all_posts
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = PhxBlog.Blog.get_post!(id)
    render(conn, "show.html", post: post)
  end
end
