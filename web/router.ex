defmodule Cloudtestapp.Router do
  use Cloudtestapp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Cloudtestapp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/quotes", QuoteController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Cloudtestapp do
  #   pipe_through :api
  # end
end
