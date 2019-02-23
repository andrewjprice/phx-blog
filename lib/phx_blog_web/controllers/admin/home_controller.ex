defmodule PhxBlogWeb.Admin.HomeController do
  use PhxBlogWeb, :controller

  def index(conn, _) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "index.html", current_user: user)
  end
end
