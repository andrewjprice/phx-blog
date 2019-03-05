defmodule PhxBlog.Blog.Post do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  alias PhxBlog.Auth.User

  schema "posts" do
    field :body, :string
    field :cover, PhxBlog.Cover.Type
    field :published, :boolean, default: false
    field :title, :string

    belongs_to :user, User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :cover, :published])
    |> validate_required([:title, :body, :published])
  end
end
