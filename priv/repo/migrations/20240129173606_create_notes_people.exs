defmodule Candone.Repo.Migrations.CreateNotesPeople do
  use Ecto.Migration

  def change do
    create table(:notes_people) do
      add :note_id, references(:notes, on_delete: :nothing)
      add :person_id, references(:people, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:notes_people, [:note_id])
    create index(:notes_people, [:person_id])
  end
end
