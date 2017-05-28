require 'test_helper'

class TourToPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour_to_position = tour_to_positions(:one)
  end

  test "should get index" do
    get tour_to_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_tour_to_position_url
    assert_response :success
  end

  test "should create tour_to_position" do
    assert_difference('TourToPosition.count') do
      post tour_to_positions_url, params: { tour_to_position: { TourPosition_id: @tour_to_position.TourPosition_id, changedFrom: @tour_to_position.changedFrom, createdFrom: @tour_to_position.createdFrom, deleteFlag: @tour_to_position.deleteFlag, endDate: @tour_to_position.endDate, joomlaID: @tour_to_position.joomlaID, startDate: @tour_to_position.startDate, syncedFrom: @tour_to_position.syncedFrom, tour_id: @tour_to_position.tour_id } }
    end

    assert_redirected_to tour_to_position_url(TourToPosition.last)
  end

  test "should show tour_to_position" do
    get tour_to_position_url(@tour_to_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_tour_to_position_url(@tour_to_position)
    assert_response :success
  end

  test "should update tour_to_position" do
    patch tour_to_position_url(@tour_to_position), params: { tour_to_position: { TourPosition_id: @tour_to_position.TourPosition_id, changedFrom: @tour_to_position.changedFrom, createdFrom: @tour_to_position.createdFrom, deleteFlag: @tour_to_position.deleteFlag, endDate: @tour_to_position.endDate, joomlaID: @tour_to_position.joomlaID, startDate: @tour_to_position.startDate, syncedFrom: @tour_to_position.syncedFrom, tour_id: @tour_to_position.tour_id } }
    assert_redirected_to tour_to_position_url(@tour_to_position)
  end

  test "should destroy tour_to_position" do
    assert_difference('TourToPosition.count', -1) do
      delete tour_to_position_url(@tour_to_position)
    end

    assert_redirected_to tour_to_positions_url
  end
end
