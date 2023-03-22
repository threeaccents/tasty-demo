defmodule Tasty.Trucks.Truck do
  use Ecto.Schema

  import Ecto.Query

  @derive {Jason.Encoder, only: [:name, :address, :permit, :approved, :items]}
  schema "trucks" do
    field :name, :string
    field :address, :string
    field :permit, :string
    field :approved, :boolean
    field :items, :string

    timestamps()
  end

  def where_name(query, name) do
    where(query, name: ^name)
  end

  def search_address(query, address) do
    from(t in query, where: like(t.address, ^"%#{address}%"))
  end

  def where_permit(query, permit) do
    where(query, permit: ^permit)
  end

  def is_approved(query) do
    where(query, approved: true)
  end

  def is_not_approved(query) do
    where(query, approved: false)
  end

  def search_items(query, items) do
    from(t in query, where: like(t.items, ^"%#{items}%"))
  end
end
