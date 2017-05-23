require 'test_helper'

class TourGuideToAgentursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour_guide_to_agentur = tour_guide_to_agenturs(:one)
  end

  test "should get index" do
    get tour_guide_to_agenturs_url
    assert_response :success
  end

  test "should get new" do
    get new_tour_guide_to_agentur_url
    assert_response :success
  end

  test "should create tour_guide_to_agentur" do
    assert_difference('TourGuideToAgentur.count') do
      post tour_guide_to_agenturs_url, params: { tour_guide_to_agentur: { agency_id: @tour_guide_to_agentur.agency_id, changedFrom: @tour_guide_to_agentur.changedFrom, createdFrom: @tour_guide_to_agentur.createdFrom, syncedFrom: @tour_guide_to_agentur.syncedFrom, tourGuide_id: @tour_guide_to_agentur.tourGuide_id } }
    end

    assert_redirected_to tour_guide_to_agentur_url(TourGuideToAgentur.last)
  end

  test "should show tour_guide_to_agentur" do
    get tour_guide_to_agentur_url(@tour_guide_to_agentur)
    assert_response :success
  end

  test "should get edit" do
    get edit_tour_guide_to_agentur_url(@tour_guide_to_agentur)
    assert_response :success
  end

  test "should update tour_guide_to_agentur" do
    patch tour_guide_to_agentur_url(@tour_guide_to_agentur), params: { tour_guide_to_agentur: { agency_id: @tour_guide_to_agentur.agency_id, changedFrom: @tour_guide_to_agentur.changedFrom, createdFrom: @tour_guide_to_agentur.createdFrom, syncedFrom: @tour_guide_to_agentur.syncedFrom, tourGuide_id: @tour_guide_to_agentur.tourGuide_id } }
    assert_redirected_to tour_guide_to_agentur_url(@tour_guide_to_agentur)
  end

  test "should destroy tour_guide_to_agentur" do
    assert_difference('TourGuideToAgentur.count', -1) do
      delete tour_guide_to_agentur_url(@tour_guide_to_agentur)
    end

    assert_redirected_to tour_guide_to_agenturs_url
  end
end
