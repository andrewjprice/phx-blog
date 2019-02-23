defmodule PhxBlog.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhxBlog.Blog.Post

  schema "users" do
    field :password, :string
    field :username, :string

    has_many :posts, Post

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
