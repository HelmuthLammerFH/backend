require 'test_helper'

class RessourceForToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ressource_for_tour = ressource_for_tours(:one)
  end

  test "should get index" do
    get ressource_for_tours_url
    assert_response :success
  end

  test "should get new" do
    get new_ressource_for_tour_url
    assert_response :success
  end

  test "should create ressource_for_tour" do
    assert_difference('RessourceForTour.count') do
      post ressource_for_tours_url, params: { ressource_for_tour: { RessourceTyp_id: @ressource_for_tour.RessourceTyp_id, changedFrom: @ressource_for_tour.changedFrom, createdFrom: @ressource_for_tour.createdFrom, deleteFlag: @ressource_for_tour.deleteFlag, joomlaID: @ressource_for_tour.joomlaID, picture: @ressource_for_tour.picture, syncedFrom: @ressource_for_tour.syncedFrom } }
    end

    assert_redirected_to ressource_for_tour_url(RessourceForTour.last)
  end

  test "should show ressource_for_tour" do
    get ressource_for_tour_url(@ressource_for_tour)
    assert_response :success
  end

  test "should get edit" do
    get edit_ressource_for_tour_url(@ressource_for_tour)
    assert_response :success
  end

  test "should update ressource_for_tour" do
    patch ressource_for_tour_url(@ressource_for_tour), params: { ressource_for_tour: { RessourceTyp_id: @ressource_for_tour.RessourceTyp_id, changedFrom: @ressource_for_tour.changedFrom, createdFrom: @ressource_for_tour.createdFrom, deleteFlag: @ressource_for_tour.deleteFlag, joomlaID: @ressource_for_tour.joomlaID, picture: @ressource_for_tour.picture, syncedFrom: @ressource_for_tour.syncedFrom } }
    assert_redirected_to ressource_for_tour_url(@ressource_for_tour)
  end

  test "should destroy ressource_for_tour" do
    assert_difference('RessourceForTour.count', -1) do
      delete ressource_for_tour_url(@ressource_for_tour)
    end

    assert_redirected_to ressource_for_tours_url
  end
end
