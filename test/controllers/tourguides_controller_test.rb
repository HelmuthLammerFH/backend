require 'test_helper'

class TourguidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tourguide = tourguides(:one)
  end

  test "should get index" do
    get tourguides_url
    assert_response :success
  end

  test "should get new" do
    get new_tourguide_url
    assert_response :success
  end

  test "should create tourguide" do
    assert_difference('Tourguide.count') do
      post tourguides_url, params: { tourguide: { agency_id: @tourguide.agency_id, changedFrom: @tourguide.changedFrom, createdFrom: @tourguide.createdFrom, deleteFlag: @tourguide.deleteFlag, syncedFrom: @tourguide.syncedFrom, tourGuideSince: @tourguide.tourGuideSince, user_id: @tourguide.user_id } }
    end

    assert_redirected_to tourguide_url(Tourguide.last)
  end

  test "should show tourguide" do
    get tourguide_url(@tourguide)
    assert_response :success
  end

  test "should get edit" do
    get edit_tourguide_url(@tourguide)
    assert_response :success
  end

  test "should update tourguide" do
    patch tourguide_url(@tourguide), params: { tourguide: { agency_id: @tourguide.agency_id, changedFrom: @tourguide.changedFrom, createdFrom: @tourguide.createdFrom, deleteFlag: @tourguide.deleteFlag, syncedFrom: @tourguide.syncedFrom, tourGuideSince: @tourguide.tourGuideSince, user_id: @tourguide.user_id } }
    assert_redirected_to tourguide_url(@tourguide)
  end

  test "should destroy tourguide" do
    assert_difference('Tourguide.count', -1) do
      delete tourguide_url(@tourguide)
    end

    assert_redirected_to tourguides_url
  end
end
