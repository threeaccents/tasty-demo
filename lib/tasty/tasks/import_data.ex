defmodule Mix.Tasks.ImportData do
  @moduledoc "The import data mix task: `mix help import_data`"
  use Mix.Task

  alias Tasty.Importer

  def run(_) do
    Mix.Task.run("app.start")

    Importer.run()
  end
end
