defmodule Candone.Repo.Migrations.CreateProjectsTasks do
  use Ecto.Migration

  def change do
    create table(:projects_tasks) do
      add :task_id, references(:tasks, on_delete: :nothing)
      add :project_id, references(:projects, on_delete: :nothing)

    end

    create index(:projects_tasks, [:task_id])
    create index(:projects_tasks, [:project_id])
  end
end
