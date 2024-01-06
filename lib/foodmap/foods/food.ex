defmodule Foodmap.Foods.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "foods" do
    field :title, :string
    field :protein, :float
    field :fat, :float
    field :carbohydrate, :float


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:title, :protein, :fat, :carbohydrate])
    |> validate_required([:title, :protein, :fat, :carbohydrate])
  end
end
