defmodule Tasty.Repo.Migrations.CreateTrucksTable do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :name, :text, null: false
      add :address, :text, null: false
      add :permit, :text, null: false
      add :approved, :boolean, null: false
      add :items, :text

      timestamps()
    end
  end
end
