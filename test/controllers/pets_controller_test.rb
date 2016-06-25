require 'test_helper'

# Tests for pet class
class PetsControllerTest < ActionController::TestCase
  setup do
    @show_pet = pets(:show_pet)
    @edit_pet = pets(:edit_pet)
    @update_pet = pets(:update_pet)
    @destroy_pet = pets(:destroy_pet)
    @feed_pet = pets(:feed_pet)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create pet' do
    assert_difference('Pet.count') do
      post :create, pet: { name: 'Gavin' }
    end

    assert_redirected_to pet_path(assigns(:pet))
  end

  test 'should show pet' do
    get :show, id: @show_pet
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @edit_pet
    assert_response :success
  end

  test 'should update pet' do
    patch :update, id: @update_pet, pet: { name: 'Fluffy' }
    assert_redirected_to pet_path(assigns(:pet))
  end

  test 'should destroy pet' do
    assert_difference('Pet.count', -1) do
      delete :destroy, id: @destroy_pet
    end

    assert_redirected_to pets_path
  end

  test 'should feed pet' do
    get :feed, id: @feed_pet
    assert_redirected_to pet_path(assigns(:pet))
    assert_operator @feed_pet.reload.hunger, :<, 1
  end
end
