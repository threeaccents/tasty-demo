defmodule Tasty.Trucks do
  alias Tasty.Trucks.Truck
  alias Tasty.Trucks.TruckFilter
  alias Tasty.Repo

  def list_trucks(filters \\ %{}) do
    Truck
    |> TruckFilter.apply(filters)
    |> Repo.all()
  end
end
