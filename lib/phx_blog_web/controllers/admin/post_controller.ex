defmodule PhxBlogWeb.Admin.PostController do
  use PhxBlogWeb, :controller

  def index(conn, _) do
    current_user = Guardian.Plug.current_resource(conn)
    posts = PhxBlog.Blog.list_posts_by_user(current_user.id)
    render conn, "index.html", posts: posts
  end

  def new(conn, _) do
    render conn, "new.html"
  end

  def edit(conn, _) do
    render conn, "edit.html"
  end

  def create(conn, _) do
  end

  def update(conn, _) do
  end

  def delete(conn, _) do
  end
end
