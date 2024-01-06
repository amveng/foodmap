defmodule FoodmapWeb.Api.V1.FoodJSON do
  alias Foodmap.Foods.Food

  @doc """
  Renders a list of foods.
  """
  def index(%{foods: foods}) do
    %{foods: for(food <- foods, do: data(food))}
  end

  @doc """
  Renders a single food.
  """
  def show(%{food: food}) do
    %{
      food: data(food)
    }
  end

  defp data(%Food{} = food) do
    %{
      id: food.id,
      title: food.title,
      protein: food.protein,
      fat: food.fat,
      carbohydrate: food.carbohydrate
    }
  end
end
