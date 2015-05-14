defmodule Cloudtestapp.PageController do
  use Cloudtestapp.Web, :controller

  plug :action

  def index(conn, _params) do
    # render conn, "index.html"
    redirect conn, to: "/quotes"
  end
end
