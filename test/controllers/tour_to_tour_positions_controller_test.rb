require 'test_helper'

class TourToTourPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour_to_tour_position = tour_to_tour_positions(:one)
  end

  test "should get index" do
    get tour_to_tour_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_tour_to_tour_position_url
    assert_response :success
  end

  test "should create tour_to_tour_position" do
    assert_difference('TourToTourPosition.count') do
      post tour_to_tour_positions_url, params: { tour_to_tour_position: { changedFrom: @tour_to_tour_position.changedFrom, createdFrom: @tour_to_tour_position.createdFrom, deleteFlag: @tour_to_tour_position.deleteFlag, endDate: @tour_to_tour_position.endDate, joomlaID: @tour_to_tour_position.joomlaID, startDate: @tour_to_tour_position.startDate, syncedFrom: @tour_to_tour_position.syncedFrom, tourPosition_id: @tour_to_tour_position.tourPosition_id } }
    end

    assert_redirected_to tour_to_tour_position_url(TourToTourPosition.last)
  end

  test "should show tour_to_tour_position" do
    get tour_to_tour_position_url(@tour_to_tour_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_tour_to_tour_position_url(@tour_to_tour_position)
    assert_response :success
  end

  test "should update tour_to_tour_position" do
    patch tour_to_tour_position_url(@tour_to_tour_position), params: { tour_to_tour_position: { changedFrom: @tour_to_tour_position.changedFrom, createdFrom: @tour_to_tour_position.createdFrom, deleteFlag: @tour_to_tour_position.deleteFlag, endDate: @tour_to_tour_position.endDate, joomlaID: @tour_to_tour_position.joomlaID, startDate: @tour_to_tour_position.startDate, syncedFrom: @tour_to_tour_position.syncedFrom, tourPosition_id: @tour_to_tour_position.tourPosition_id } }
    assert_redirected_to tour_to_tour_position_url(@tour_to_tour_position)
  end

  test "should destroy tour_to_tour_position" do
    assert_difference('TourToTourPosition.count', -1) do
      delete tour_to_tour_position_url(@tour_to_tour_position)
    end

    assert_redirected_to tour_to_tour_positions_url
  end
end
