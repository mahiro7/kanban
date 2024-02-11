defmodule Candone.Repo.Migrations.CreateProjectsNotes do
  use Ecto.Migration

  def change do
    create table(:projects_notes) do
      add :note_id, references(:notes, on_delete: :nothing)
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:projects_notes, [:note_id])
    create index(:projects_notes, [:project_id])
  end
end
