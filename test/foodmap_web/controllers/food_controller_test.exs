defmodule FoodmapWeb.FoodControllerTest do
  use FoodmapWeb.ConnCase

  import Foodmap.FoodsFixtures

  alias Foodmap.Foods.Food

  @create_attrs %{
    title: "some title"
  }
  @update_attrs %{
    title: "some updated title"
  }
  @invalid_attrs %{title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all foods", %{conn: conn} do
      conn = get(conn, ~p"/api/v1/foods")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create food" do
    test "renders food when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/v1/foods", food: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/foods/#{id}")

      assert %{
               "id" => ^id,
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/v1/foods", food: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update food" do
    setup [:create_food]

    test "renders food when data is valid", %{conn: conn, food: %Food{id: id} = food} do
      conn = put(conn, ~p"/api/v1/foods/#{food}", food: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/v1/foods/#{id}")

      assert %{
               "id" => ^id,
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, food: food} do
      conn = put(conn, ~p"/api/v1/foods/#{food}", food: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete food" do
    setup [:create_food]

    test "deletes chosen food", %{conn: conn, food: food} do
      conn = delete(conn, ~p"/api/v1/foods/#{food}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/v1/foods/#{food}")
      end
    end
  end

  defp create_food(_) do
    food = food_fixture()
    %{food: food}
  end
end
