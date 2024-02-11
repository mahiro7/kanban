defmodule Candone.Repo.Migrations.RemoveTimestampFromProjectsNotes do
  use Ecto.Migration

  def change do
    alter table(:projects_notes) do
      remove :inserted_at
      remove :updated_at
    end
  end
end
