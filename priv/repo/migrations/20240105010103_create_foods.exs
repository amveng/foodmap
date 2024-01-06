defmodule Foodmap.Repo.Migrations.CreateFoods do
  use Ecto.Migration

  def change do
    create table(:foods) do
      add :title, :string
      add :protein, :float
      add :fat, :float
      add :carbohydrate, :float

      timestamps(type: :utc_datetime)
    end
  end
end
