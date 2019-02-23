defmodule PhxBlogWeb.Admin.PostController do
  use PhxBlogWeb, :controller

  def index(conn, _) do
    render conn, "index.html"
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
