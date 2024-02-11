defmodule Candone.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :description, :string
      add :cost, :integer, default: 0
      add :urgency, :integer
      add :stage, :integer, default: 0
      add :done_at, :naive_datetime, default: nil
      add :done_at_ww, :integer, default: 0

      timestamps(type: :utc_datetime)
    end
  end
end
