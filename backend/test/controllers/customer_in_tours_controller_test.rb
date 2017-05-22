require 'test_helper'

class CustomerInToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_in_tour = customer_in_tours(:one)
  end

  test "should get index" do
    get customer_in_tours_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_in_tour_url
    assert_response :success
  end

  test "should create customer_in_tour" do
    assert_difference('CustomerInTour.count') do
      post customer_in_tours_url, params: { customer_in_tour: { bookedDate: @customer_in_tour.bookedDate, changedFrom: @customer_in_tour.changedFrom, createdFrom: @customer_in_tour.createdFrom, feedbackTourGuid: @customer_in_tour.feedbackTourGuid, participated: @customer_in_tour.participated, starRating: @customer_in_tour.starRating, syncedFrom: @customer_in_tour.syncedFrom } }
    end

    assert_redirected_to customer_in_tour_url(CustomerInTour.last)
  end

  test "should show customer_in_tour" do
    get customer_in_tour_url(@customer_in_tour)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_in_tour_url(@customer_in_tour)
    assert_response :success
  end

  test "should update customer_in_tour" do
    patch customer_in_tour_url(@customer_in_tour), params: { customer_in_tour: { bookedDate: @customer_in_tour.bookedDate, changedFrom: @customer_in_tour.changedFrom, createdFrom: @customer_in_tour.createdFrom, feedbackTourGuid: @customer_in_tour.feedbackTourGuid, participated: @customer_in_tour.participated, starRating: @customer_in_tour.starRating, syncedFrom: @customer_in_tour.syncedFrom } }
    assert_redirected_to customer_in_tour_url(@customer_in_tour)
  end

  test "should destroy customer_in_tour" do
    assert_difference('CustomerInTour.count', -1) do
      delete customer_in_tour_url(@customer_in_tour)
    end

    assert_redirected_to customer_in_tours_url
  end
end
