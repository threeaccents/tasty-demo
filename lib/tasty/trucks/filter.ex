defmodule Tasty.Trucks.TruckFilter do
  @behaviour Tasty.Filter

  alias Tasty.Trucks.Truck

  def apply(query \\ Truck, params) do
    Tasty.Filter.apply(query, params, &apply_key/3)
  end

  defp apply_key(query, "name", name) do
    Truck.where_name(query, name)
  end

  defp apply_key(query, "address", address) do
    Truck.search_address(query, address)
  end

  defp apply_key(query, "permit", permit) do
    Truck.where_permit(query, permit)
  end

  defp apply_key(query, "approved", "true") do
    Truck.is_approved(query)
  end

  defp apply_key(query, "approved", "false") do
    Truck.is_not_approved(query)
  end

  defp apply_key(query, "items", items) do
    Truck.search_items(query, items)
  end

  defp apply_key(query, _, _), do: query
end
