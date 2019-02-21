defmodule PhxBlogWeb.PageController do
  use PhxBlogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def admin(conn, _) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "admin.html", current_user: user)
  end
end
