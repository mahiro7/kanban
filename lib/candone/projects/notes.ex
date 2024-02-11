defmodule Candone.Projects.Notes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects_notes" do

    field :note_id, :id
    field :project_id, :id

    # timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(notes, attrs) do
    notes
    |> cast(attrs, [])
    |> validate_required([])
  end
end
