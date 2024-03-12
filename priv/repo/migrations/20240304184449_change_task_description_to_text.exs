defmodule Candone.Repo.Migrations.ChangeTaskDescriptionToText do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      modify :description, :text
    end
  end
end
