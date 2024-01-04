defmodule Foodmap.Repo do
  use Ecto.Repo,
    otp_app: :foodmap,
    adapter: Ecto.Adapters.Postgres
end
