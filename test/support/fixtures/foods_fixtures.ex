defmodule Foodmap.FoodsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Foodmap.Foods` context.
  """

  @doc """
  Generate a food.
  """
  def food_fixture(attrs \\ %{}) do
    {:ok, food} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Foodmap.Foods.create_food()

    food
  end
end
