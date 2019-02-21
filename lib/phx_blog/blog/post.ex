defmodule PhxBlog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :body, :string
    field :cover, :string
    field :published, :boolean, default: false
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :cover, :published])
    |> validate_required([:title, :body, :cover, :published])
  end
end
