defmodule Mix.Tasks.ImportData do
  @moduledoc "The import data mix task: `mix help import_data`"
  use Mix.Task

  alias Tasty.Repo

  @csv_file_path "#{File.cwd!()}/Mobile_Food_Facility_Permit.csv"
  @name 1
  @address 5
  @permit 9
  @status 10
  @items 11

  def run(_) do
    Mix.Task.run("app.start")

    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

    trucks =
      @csv_file_path
      |> File.stream!()
      |> CSV.decode()
      |> Enum.map(fn {:ok, row} ->
        Map.new()
        |> Map.put(:name, Enum.at(row, @name))
        |> Map.put(:address, Enum.at(row, @address))
        |> Map.put(:permit, Enum.at(row, @permit))
        |> Map.put(:approved, Enum.at(row, @status) == "APPROVED")
        |> Map.put(:items, Enum.at(row, @items))
        |> Map.put(:inserted_at, now)
        |> Map.put(:updated_at, now)
      end)

    Repo.insert_all(Tasty.Trucks.Truck, trucks)
  end
end
