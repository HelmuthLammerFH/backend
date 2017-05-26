require 'test_helper'

class TourPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour_position = tour_positions(:one)
  end

  test "should get index" do
    get tour_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_tour_position_url
    assert_response :success
  end

  test "should create tour_position" do
    assert_difference('TourPosition.count') do
      post tour_positions_url, params: { tour_position: { changedFrom: @tour_position.changedFrom, createdFrom: @tour_position.createdFrom, deleteFlag: @tour_position.deleteFlag, joomlaID: @tour_position.joomlaID, name: @tour_position.name, position: @tour_position.position, syncedFrom: @tour_position.syncedFrom } }
    end

    assert_redirected_to tour_position_url(TourPosition.last)
  end

  test "should show tour_position" do
    get tour_position_url(@tour_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_tour_position_url(@tour_position)
    assert_response :success
  end

  test "should update tour_position" do
    patch tour_position_url(@tour_position), params: { tour_position: { changedFrom: @tour_position.changedFrom, createdFrom: @tour_position.createdFrom, deleteFlag: @tour_position.deleteFlag, joomlaID: @tour_position.joomlaID, name: @tour_position.name, position: @tour_position.position, syncedFrom: @tour_position.syncedFrom } }
    assert_redirected_to tour_position_url(@tour_position)
  end

  test "should destroy tour_position" do
    assert_difference('TourPosition.count', -1) do
      delete tour_position_url(@tour_position)
    end

    assert_redirected_to tour_positions_url
  end
end
