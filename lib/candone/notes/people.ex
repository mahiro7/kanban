defmodule Candone.Notes.People do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes_people" do

    field :note_id, :id
    field :person_id, :id

    # timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(people, attrs) do
    people
    |> cast(attrs, [])
    |> validate_required([])
  end
end
