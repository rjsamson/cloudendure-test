defmodule Cloudtestapp.QuoteController do
  use Cloudtestapp.Web, :controller

  alias Cloudtestapp.Quote

  plug :scrub_params, "quote" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    quotes = Repo.all(Quote)
    render(conn, "index.html", quotes: quotes)
  end

  def new(conn, _params) do
    changeset = Quote.changeset(%Quote{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quote" => quote_params}) do
    changeset = Quote.changeset(%Quote{}, quote_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Quote created successfully.")
      |> redirect(to: quote_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    quote = Repo.get(Quote, id)
    render(conn, "show.html", quote: quote)
  end

  def edit(conn, %{"id" => id}) do
    quote = Repo.get(Quote, id)
    changeset = Quote.changeset(quote)
    render(conn, "edit.html", quote: quote, changeset: changeset)
  end

  def update(conn, %{"id" => id, "quote" => quote_params}) do
    quote = Repo.get(Quote, id)
    changeset = Quote.changeset(quote, quote_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Quote updated successfully.")
      |> redirect(to: quote_path(conn, :index))
    else
      render(conn, "edit.html", quote: quote, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    quote = Repo.get(Quote, id)
    Repo.delete(quote)

    conn
    |> put_flash(:info, "Quote deleted successfully.")
    |> redirect(to: quote_path(conn, :index))
  end
end
