require 'test_helper'

class TourGuidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour_guide = tour_guides(:one)
  end

  test "should get index" do
    get tour_guides_url
    assert_response :success
  end

  test "should get new" do
    get new_tour_guide_url
    assert_response :success
  end

  test "should create tour_guide" do
    assert_difference('TourGuide.count') do
      post tour_guides_url, params: { tour_guide: { changedFrom: @tour_guide.changedFrom, createdFrom: @tour_guide.createdFrom, syncedFrom: @tour_guide.syncedFrom, tourGuideSince: @tour_guide.tourGuideSince } }
    end

    assert_redirected_to tour_guide_url(TourGuide.last)
  end

  test "should show tour_guide" do
    get tour_guide_url(@tour_guide)
    assert_response :success
  end

  test "should get edit" do
    get edit_tour_guide_url(@tour_guide)
    assert_response :success
  end

  test "should update tour_guide" do
    patch tour_guide_url(@tour_guide), params: { tour_guide: { changedFrom: @tour_guide.changedFrom, createdFrom: @tour_guide.createdFrom, syncedFrom: @tour_guide.syncedFrom, tourGuideSince: @tour_guide.tourGuideSince } }
    assert_redirected_to tour_guide_url(@tour_guide)
  end

  test "should destroy tour_guide" do
    assert_difference('TourGuide.count', -1) do
      delete tour_guide_url(@tour_guide)
    end

    assert_redirected_to tour_guides_url
  end
end
