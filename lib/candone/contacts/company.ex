defmodule Candone.Contacts.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :name, :string
    field :address, :string
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:address, :description, :name])
    |> validate_required([:description, :name])
  end
end
