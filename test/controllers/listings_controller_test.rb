require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post :create, listing: { active: @listing.active, address: @listing.address, contact_email: @listing.contact_email, descrption: @listing.descrption, featured: @listing.featured, geocode: @listing.geocode, name: @listing.name, neighborhood_id: @listing.neighborhood_id, phone_number: @listing.phone_number, slug: @listing.slug, website_url: @listing.website_url, zip: @listing.zip }
    end

    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should show listing" do
    get :show, id: @listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing
    assert_response :success
  end

  test "should update listing" do
    patch :update, id: @listing, listing: { active: @listing.active, address: @listing.address, contact_email: @listing.contact_email, descrption: @listing.descrption, featured: @listing.featured, geocode: @listing.geocode, name: @listing.name, neighborhood_id: @listing.neighborhood_id, phone_number: @listing.phone_number, slug: @listing.slug, website_url: @listing.website_url, zip: @listing.zip }
    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete :destroy, id: @listing
    end

    assert_redirected_to listings_path
  end
end
