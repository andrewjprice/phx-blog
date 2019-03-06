defmodule PhxBlogWeb.Router do
  use PhxBlogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Our pipeline implements "maybe" authenticated. We'll use the `:ensure_auth` below for when we need to make sure someone is logged in.
  pipeline :auth do
    plug PhxBlog.Auth.Pipeline
  end

  # We use ensure_auth to fail if there is no one logged in
  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  # Visitor
  scope "/", PhxBlogWeb do
    pipe_through [:browser, :auth]

    get "/login", SessionController, :new
    post "/login", SessionController, :login

    get "/", PageController, :index
    get "/post/:id", PageController, :show
  end

  # Admin
  scope "/admin", PhxBlogWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    post "/logout", SessionController, :logout
    get "/", Admin.HomeController, :index

    resources "/posts", Admin.PostController, except: [:show] do
      get "/publish", Admin.PostController, :publish, as: :publish
    end
  end
end
