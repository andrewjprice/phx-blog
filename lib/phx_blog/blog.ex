defmodule PhxBlog.Blog do
  import Ecto.Query, warn: false

  alias PhxBlog.{Repo, Blog.Post}

  def list_all_posts do
    Repo.all(Post)
    |> Repo.preload(:user)
  end

  def list_posts_by_user(user_id) do
    query = from p in Post, where: p.user_id == ^user_id
    Repo.all(query)
    |> Repo.preload(:user)
  end

  def get_post!(id) do
    Repo.get!(Post, id)
    |> Repo.preload(:user)
  end

  def create(user, post_params) do
    changeset =
      user
      |> Ecto.build_assoc(:posts)
      |> Post.changeset(post_params)

    Repo.insert(changeset)
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def change_post(%Post{} = post) do
    Post.changeset(post, %{})
  end
end
