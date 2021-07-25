require "test_helper"

class API::V1::ProgramControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment = Equipment.create(name: "barbell")
    @equipment_alt = Equipment.create(name: "bench")
    @sport = Sport.create(name: "basketball")
    @sport_alt = Sport.create(name: "football")
  end

  test "should handle search with 1 equipment and 1 sport" do
    Program.create(name: "foo", equipment: [@equipment], sport: @sport)

    get "/api/v1/program", params: { equipment: [@equipment.name], sport: @sport.name }

    assert_response(:success)
    assert(@response.parsed_body.length == 1)
  end

  test "should handle search with 1 equipment and no sport" do
    Program.create(name: "foo", equipment: [@equipment], sport: @sport)

    get "/api/v1/program", params: { equipment: [@equipment.name] }

    assert_response(:success)
    assert(@response.parsed_body.length == 1)
  end

  test "should handle search with no equipment and 1 sport" do
    Program.create(name: "foo", equipment: [@equipment], sport: @sport)
    Program.create(name: "bar", equipment: [@equipment, @equipment_alt], sport: @sport)

    get "/api/v1/program", params: { sport: @sport.name }

    assert_response(:success)
    assert(@response.parsed_body.length == 2)
  end

  test "should handle search with multiple equipment and no sport" do
    Program.create(name: "foo", equipment: [@equipment, @equipment_alt], sport: @sport)
    Program.create(name: "bar", equipment: [@equipment], sport: @sport_alt)

    get "/api/v1/program", params: { sport: @sport.name, equipment: [@equipment.name, @equipment_alt.name] }

    assert_response(:success)
    assert(@response.parsed_body.length == 1)
    assert(@response.parsed_body[0]["name"] == "foo")
  end

  test "should handle search with multiple equipment and 1 sport" do
    Program.create(name: "foo", equipment: [@equipment, @equipment_alt], sport: @sport)
    Program.create(name: "bar", equipment: [@equipment, @equipment_alt], sport: @sport_alt)

    get "/api/v1/program", params: { equipment: [@equipment.name, @equipment_alt.name], sport: @sport_alt.name }

    assert_response(:success)
    assert(@response.parsed_body.length == 1)
    assert(@response.parsed_body[0]["name"] == "bar")
  end
end
