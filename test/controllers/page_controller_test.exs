defmodule Cloudtestapp.PageControllerTest do
  use Cloudtestapp.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
