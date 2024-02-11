defmodule Candone.Tasks.People do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks_people" do

    field :task_id, :id
    field :person_id, :id

    # timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [])
    |> validate_required([])
  end
end
