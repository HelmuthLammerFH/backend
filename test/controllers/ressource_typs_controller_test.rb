require 'test_helper'

class RessourceTypsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ressource_typ = ressource_typs(:one)
  end

  test "should get index" do
    get ressource_typs_url
    assert_response :success
  end

  test "should get new" do
    get new_ressource_typ_url
    assert_response :success
  end

  test "should create ressource_typ" do
    assert_difference('RessourceTyp.count') do
      post ressource_typs_url, params: { ressource_typ: { changedFrom: @ressource_typ.changedFrom, createdFrom: @ressource_typ.createdFrom, name: @ressource_typ.name, syncedFrom: @ressource_typ.syncedFrom } }
    end

    assert_redirected_to ressource_typ_url(RessourceTyp.last)
  end

  test "should show ressource_typ" do
    get ressource_typ_url(@ressource_typ)
    assert_response :success
  end

  test "should get edit" do
    get edit_ressource_typ_url(@ressource_typ)
    assert_response :success
  end

  test "should update ressource_typ" do
    patch ressource_typ_url(@ressource_typ), params: { ressource_typ: { changedFrom: @ressource_typ.changedFrom, createdFrom: @ressource_typ.createdFrom, name: @ressource_typ.name, syncedFrom: @ressource_typ.syncedFrom } }
    assert_redirected_to ressource_typ_url(@ressource_typ)
  end

  test "should destroy ressource_typ" do
    assert_difference('RessourceTyp.count', -1) do
      delete ressource_typ_url(@ressource_typ)
    end

    assert_redirected_to ressource_typs_url
  end
end
