defmodule Cloudtestapp.QuoteControllerTest do
  use Cloudtestapp.ConnCase

  alias Cloudtestapp.Quote
  @valid_params quote: %{author: "some content", quote: "some content"}
  @invalid_params quote: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /quotes", %{conn: conn} do
    conn = get conn, quote_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing quotes"
  end

  test "GET /quotes/new", %{conn: conn} do
    conn = get conn, quote_path(conn, :new)
    assert html_response(conn, 200) =~ "New quote"
  end

  test "POST /quotes with valid data", %{conn: conn} do
    conn = post conn, quote_path(conn, :create), @valid_params
    assert redirected_to(conn) == quote_path(conn, :index)
  end

  test "POST /quotes with invalid data", %{conn: conn} do
    conn = post conn, quote_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New quote"
  end

  test "GET /quotes/:id", %{conn: conn} do
    quote = Repo.insert %Quote{}
    conn = get conn, quote_path(conn, :show, quote)
    assert html_response(conn, 200) =~ "Show quote"
  end

  test "GET /quotes/:id/edit", %{conn: conn} do
    quote = Repo.insert %Quote{}
    conn = get conn, quote_path(conn, :edit, quote)
    assert html_response(conn, 200) =~ "Edit quote"
  end

  test "PUT /quotes/:id with valid data", %{conn: conn} do
    quote = Repo.insert %Quote{}
    conn = put conn, quote_path(conn, :update, quote), @valid_params
    assert redirected_to(conn) == quote_path(conn, :index)
  end

  test "PUT /quotes/:id with invalid data", %{conn: conn} do
    quote = Repo.insert %Quote{}
    conn = put conn, quote_path(conn, :update, quote), @invalid_params
    assert html_response(conn, 200) =~ "Edit quote"
  end

  test "DELETE /quotes/:id", %{conn: conn} do
    quote = Repo.insert %Quote{}
    conn = delete conn, quote_path(conn, :delete, quote)
    assert redirected_to(conn) == quote_path(conn, :index)
    refute Repo.get(Quote, quote.id)
  end
end
