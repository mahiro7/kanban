defmodule Candone.Repo.Migrations.CreateTasksPeople do
  use Ecto.Migration

  def change do
    create table(:tasks_people) do
      add :task_id, references(:tasks, on_delete: :nothing)
      add :person_id, references(:people, on_delete: :nothing)
    end

    create index(:tasks_people, [:task_id])
    create index(:tasks_people, [:person_id])
  end
end
