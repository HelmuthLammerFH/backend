require 'test_helper'

class TourpositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tourposition = tourpositions(:one)
  end

  test "should get index" do
    get tourpositions_url
    assert_response :success
  end

  test "should get new" do
    get new_tourposition_url
    assert_response :success
  end

  test "should create tourposition" do
    assert_difference('Tourposition.count') do
      post tourpositions_url, params: { tourposition: { changedFrom: @tourposition.changedFrom, createdFrom: @tourposition.createdFrom, deleteFlag: @tourposition.deleteFlag, description: @tourposition.description, name: @tourposition.name, position: @tourposition.position, price: @tourposition.price, syncedFrom: @tourposition.syncedFrom } }
    end

    assert_redirected_to tourposition_url(Tourposition.last)
  end

  test "should show tourposition" do
    get tourposition_url(@tourposition)
    assert_response :success
  end

  test "should get edit" do
    get edit_tourposition_url(@tourposition)
    assert_response :success
  end

  test "should update tourposition" do
    patch tourposition_url(@tourposition), params: { tourposition: { changedFrom: @tourposition.changedFrom, createdFrom: @tourposition.createdFrom, deleteFlag: @tourposition.deleteFlag, description: @tourposition.description, name: @tourposition.name, position: @tourposition.position, price: @tourposition.price, syncedFrom: @tourposition.syncedFrom } }
    assert_redirected_to tourposition_url(@tourposition)
  end

  test "should destroy tourposition" do
    assert_difference('Tourposition.count', -1) do
      delete tourposition_url(@tourposition)
    end

    assert_redirected_to tourpositions_url
  end
end
