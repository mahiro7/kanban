defmodule Candone.Repo.Seeds do
  import Ecto.Query
  alias Candone.Repo
  alias Candone.Contacts.{Company, Person}

  company =
    Repo.get_by(Company, name: "Tech Solutions Inc.") ||
    %Company{
      name: "Tech Solutions Inc.",
      address: "1234 Silicon Valley, CA",
      description: "Technology company"
    }
    |> Repo.insert!()

  Enum.each([
    %Person{
      first_name: "John",
      middle_name: "Michael",
      last_name: "Doe",
      description: "Senior Developer",
      company_id: company.id
    },
    %Person{
      first_name: "Jane",
      middle_name: "Elizabeth",
      last_name: "Smith",
      description: "Project Manager",
      company_id: company.id
    },
    %Person{
      first_name: "Alice",
      middle_name: "Marie",
      last_name: "Johnson",
      description: "UX Designer",
      company_id: company.id
    },
    %Person{
      first_name: "Bob",
      middle_name: "James",
      last_name: "Brown",
      description: "HR Specialist",
      company_id: company.id
    }
  ], fn person ->
    if Repo.one(from(p in Person, where: p.first_name == ^person.first_name and p.last_name == ^person.last_name)) == nil do
      Repo.insert!(person)
    end
  end)

  IO.puts("Inserted a company and 4 people into the database if not already present")
end
