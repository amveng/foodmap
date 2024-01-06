defmodule Foodmap.FoodsTest do
  use Foodmap.DataCase

  alias Foodmap.Foods

  describe "foods" do
    alias Foodmap.Foods.Food

    import Foodmap.FoodsFixtures

    @invalid_attrs %{title: nil}

    test "list_foods/0 returns all foods" do
      food = food_fixture()
      assert Foods.list_foods() == [food]
    end

    test "get_food!/1 returns the food with given id" do
      food = food_fixture()
      assert Foods.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Food{} = food} = Foods.create_food(valid_attrs)
      assert food.title == "some title"
    end

    test "create_food/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Foods.create_food(@invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = food_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Food{} = food} = Foods.update_food(food, update_attrs)
      assert food.title == "some updated title"
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = food_fixture()
      assert {:error, %Ecto.Changeset{}} = Foods.update_food(food, @invalid_attrs)
      assert food == Foods.get_food!(food.id)
    end

    test "delete_food/1 deletes the food" do
      food = food_fixture()
      assert {:ok, %Food{}} = Foods.delete_food(food)
      assert_raise Ecto.NoResultsError, fn -> Foods.get_food!(food.id) end
    end

    test "change_food/1 returns a food changeset" do
      food = food_fixture()
      assert %Ecto.Changeset{} = Foods.change_food(food)
    end
  end
end
