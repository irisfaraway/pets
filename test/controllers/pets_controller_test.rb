require 'test_helper'

# Tests for pet class
class PetsControllerTest < ActionController::TestCase
  setup do
    # Set pets
    @show_pet = pets(:show_pet)
    @edit_pet = pets(:edit_pet)
    @update_pet = pets(:update_pet)
    @destroy_pet = pets(:destroy_pet)
    @feed_pet = pets(:feed_pet)
    @normal_user_pet = pets(:normal_user_pet)

    # Set user and session
    @admin_user = users(:admin_user)
    @normal_user_one = users(:normal_user_one)
    session[:user_id] = @admin_user.id
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets)
  end

  test 'should get new' do
    session[:user_id] = @normal_user_one.id
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

  test 'should let admins feed pets that are not theirs' do
    get :feed, id: @normal_user_pet
    assert_redirected_to pet_path(assigns(:pet))
    assert_operator @normal_user_pet.reload.hunger, :<, 1
  end

  test 'should not let normal users feed pets that are not theirs' do
    session[:user_id] = @normal_user_one.id
    get :feed, id: @feed_pet
    assert_response 302
  end
end
