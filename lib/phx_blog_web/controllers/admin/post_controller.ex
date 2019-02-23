defmodule PhxBlogWeb.Admin.PostController do
  use PhxBlogWeb, :controller

  alias PhxBlog.{Blog, Blog.Post}

  def index(conn, _) do
    current_user = Guardian.Plug.current_resource(conn)
    posts = PhxBlog.Blog.list_posts_by_user(current_user.id)
    render conn, "index.html", posts: posts
  end

  def new(conn, _) do
    changeset = Post.changeset(%Post{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def edit(conn, _) do
    render conn, "edit.html"
  end

  def create(conn, %{"post" => params}) do
    current_user = Guardian.Plug.current_resource(conn)
    with {:ok, _post} <- Blog.create(current_user, params) do
      conn
      |> put_flash(:info, "Successfully created post")
      |> redirect(to: Routes.post_path(conn, :index))
    else
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Failed to create new post")
        |> render("new.html", changeset: %{changeset | action: :new})
    end
  end

  def update(conn, _) do
  end

  def delete(conn, _) do
  end
end
