defmodule Candone.Projects.Tasks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects_tasks" do

    field :task_id, :id
    field :project_id, :id

    # timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tasks, attrs) do
    tasks
    |> cast(attrs, [])
    |> validate_required([])
  end
end
