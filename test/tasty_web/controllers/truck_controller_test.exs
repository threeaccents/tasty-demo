defmodule TastyWeb.TruckControllerTest do
  use TastyWeb.ConnCase

  setup %{conn: conn} do
    Tasty.Importer.run()
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "GET /trucks" do
    test "/trucks", %{conn: conn} do
      conn = get(conn, ~p"/trucks")
      assert trucks = json_response(conn, 200)["data"]
      assert length(trucks) > 0
    end

    test "can filter by name", %{conn: conn} do
      truck_name = "Bonito Poke"
      conn = get(conn, ~p"/trucks?name=#{truck_name}")
      assert trucks = json_response(conn, 200)["data"]

      for truck <- trucks do
        assert truck["name"] == truck_name
      end
    end

    test "can filter by address", %{conn: conn} do
      address = "2155"

      conn = get(conn, ~p"/trucks?address=#{address}")

      assert trucks = json_response(conn, 200)["data"]

      for truck <- trucks do
        assert String.contains?(truck["address"], address)
      end
    end

    test "can filter by multiple fields", %{conn: conn} do
      # we know off grid services has multiple entries.
      # thats why we chose it for this test.
      name = "Off the Grid Services, LLC"
      address = "185"

      conn = get(conn, ~p"/trucks?name=#{name}&address=#{address}")

      assert trucks = json_response(conn, 200)["data"]

      for truck <- trucks do
        assert truck["name"] == name
        assert String.contains?(truck["address"], address)
      end
    end
  end
end
