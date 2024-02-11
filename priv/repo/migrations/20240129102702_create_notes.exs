defmodule Candone.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :name, :string
      add :content, :text

      timestamps(type: :utc_datetime)
    end
  end
end
