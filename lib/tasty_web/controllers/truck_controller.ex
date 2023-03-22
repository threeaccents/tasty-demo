defmodule TastyWeb.TruckController do
  use TastyWeb, :controller

  alias Tasty.Trucks

  def index(conn, params) do
    trucks = Trucks.list_trucks(params)

    conn
    |> put_status(:ok)
    |> put_view(TastyWeb.TruckView)
    |> json(%{data: trucks})
  end
end
