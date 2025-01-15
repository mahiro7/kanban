if ! mix ecto.migrate; then
  echo "Running migrations..."
fi

if ! mix run priv/repo/seeds.exs; then
  echo "Seeding the database..."
fi

exec npm install && mix setup && mix phx.server