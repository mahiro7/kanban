defmodule Candone.Repo.Migrations.RemoveTimestampFromNotesPeople do
  use Ecto.Migration

  def change do
    alter table(:notes_people) do
      remove :inserted_at
      remove :updated_at
    end
  end
end
