defmodule Tasty.Trucks.Truck do
  use Ecto.Schema

  schema "trucks" do
    field :name, :string
    field :address, :string
    field :permit, :string
    field :approved, :boolean
    field :items, :string

    timestamps()
  end
end
