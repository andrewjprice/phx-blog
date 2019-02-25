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

  def edit(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    changeset = Post.changeset(post, %{})
    render conn, "edit.html", changeset: changeset, post: post
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

  def update(conn, %{"id" => id, "post" => params}) do
    post = Blog.get_post!(id)
    with {:ok, _post} <- Blog.update_post(post, params) do
      conn
      |> put_flash(:info, "Successfully updated post")
      |> redirect(to: Routes.post_path(conn, :index))
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    {:ok, _post} = Blog.delete_post(post)
    conn
    |> put_flash(:info, "Successfully deleted post")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
