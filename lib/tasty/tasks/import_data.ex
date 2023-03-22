defmodule Mix.Tasks.ImportData do
  @moduledoc "The import data mix task: `mix help import_data`"
  use Mix.Task

  alias Tasty.Importer

  def run(_) do
    Importer.run()
  end
end
