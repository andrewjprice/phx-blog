defmodule PhxBlogWeb.PageController do
  use PhxBlogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
